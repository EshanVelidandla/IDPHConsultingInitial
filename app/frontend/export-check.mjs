/**
 * Regression check for the top strip's Export button (issue #35).
 *
 * Export used to read the Map's cause whatever view was on screen. This runs
 * the built SPA in jsdom against a small stub API, so no backend, data files or
 * browser are needed, and checks what each view actually downloads.
 *
 * Usage:
 *   npx vite build --outDir <temp dir> --emptyOutDir
 *   UI_DIR=<temp dir> npm run check:export
 */

import { JSDOM, VirtualConsole } from 'jsdom';
import fs from 'node:fs';
import http from 'node:http';
import path from 'node:path';

const UI = process.env.UI_DIR ?? '../backend/ui';

const PROVIDER_ROWS = [
  { County: 'ILLINOIS', 2021: 80, 2022: 81.5 },
  { County: 'Adams', 2021: 70, 2022: 72.25 },
  { County: 'Brown', 2021: 0, 2022: 0 },
  { County: 'Calhoun', 2021: 5, 2022: null },
  { County: 'Chicago', 2021: 90, 2022: 91 },
];
const DEATH_ROWS = [
  { County: 'ILLINOIS', 2021: 100, 2022: 110 },
  { County: 'Adams', 2021: 90, 2022: 95 },
];

function startStub() {
  const log = [];
  const state = { failExport: false };
  const html = fs.readFileSync(path.join(UI, 'index.html'), 'utf8');
  const server = http.createServer((req, res) => {
    const url = req.url;
    log.push(url);
    const json = body => {
      res.writeHead(200, { 'content-type': 'application/json' });
      res.end(JSON.stringify(body));
    };
    if (url.startsWith('/export/csv')) {
      if (state.failExport) { res.writeHead(500); res.end('boom'); return; }
      res.writeHead(200, { 'content-type': 'text/csv' });
      res.end('County,2022\nAdams,95\n');
    } else if (url.startsWith('/meta')) json({ year_min: 2008, year_max: 2022, provider_metrics: {} });
    else if (url.startsWith('/provider_data')) json(PROVIDER_ROWS);
    else if (url.startsWith('/death_rates')) json(DEATH_ROWS);
    else if (url.startsWith('/geojson')) json({ type: 'FeatureCollection', features: [] });
    else if (url.startsWith('/assets')) { res.writeHead(404); res.end(); }
    else if (req.headers.accept?.includes('text/html')) { res.writeHead(200, { 'content-type': 'text/html' }); res.end(html); }
    else json([]);
  });
  return new Promise(resolve => server.listen(0, '127.0.0.1', () => {
    resolve({ server, log, state, origin: `http://127.0.0.1:${server.address().port}` });
  }));
}

function loadBundle() {
  const html = fs.readFileSync(path.join(UI, 'index.html'), 'utf8');
  const match = html.match(/src="([^"]+\.js)"/);
  if (!match) throw new Error(`No bundle referenced in ${UI}/index.html. Build first.`);
  const code = fs
    .readFileSync(path.join(UI, match[1].replace(/^\//, '')), 'utf8')
    .replace(/import\.meta/g, '({env:{}})');
  return { html, code };
}

const sleep = ms => new Promise(r => setTimeout(r, ms));

async function waitFor(fn, what, ms = 4000) {
  const end = Date.now() + ms;
  for (;;) {
    const v = fn();
    if (v) return v;
    if (Date.now() > end) throw new Error(`Timed out waiting for ${what}`);
    await sleep(25);
  }
}

function open(route, origin, bundle) {
  const dom = new JSDOM(bundle.html, {
    runScripts: 'dangerously',
    url: origin + route,
    virtualConsole: new VirtualConsole(),
    pretendToBeVisual: true,
  });
  const w = dom.window;
  w.matchMedia ??= () => ({
    matches: false, media: '',
    addListener() {}, removeListener() {},
    addEventListener() {}, removeEventListener() {},
  });
  w.ResizeObserver ??= class { observe() {} unobserve() {} disconnect() {} };
  w.scrollTo = () => {};

  const page = { w, alerts: [], downloads: [], blobs: [] };
  w.alert = msg => page.alerts.push(msg);
  w.URL.createObjectURL = blob => { page.blobs.push(blob); return 'blob:check'; };
  w.URL.revokeObjectURL = () => {};
  const click = w.HTMLAnchorElement.prototype.click;
  w.HTMLAnchorElement.prototype.click = function () {
    if (this.hasAttribute('download')) page.downloads.push(this.getAttribute('download'));
    else click.call(this);
  };
  w.eval(bundle.code);
  return page;
}

const exportButton = page =>
  [...page.w.document.querySelectorAll('.topstrip button')].find(b => /Export/.test(b.textContent));

function pick(page, select, value) {
  const set = Object.getOwnPropertyDescriptor(page.w.HTMLSelectElement.prototype, 'value').set;
  set.call(select, value);
  select.dispatchEvent(new page.w.Event('change', { bubbles: true }));
}

const causeSelect = page => waitFor(
  () => [...page.w.document.querySelectorAll('select')].find(s => [...s.options].some(o => o.value === 'COVID_19')),
  'a cause select',
);

const readBlob = (page, blob) => new Promise((resolve, reject) => {
  const r = new page.w.FileReader();
  r.onload = () => resolve(r.result);
  r.onerror = reject;
  r.readAsText(blob);
});

function assert(cond, msg) {
  if (!cond) throw new Error(msg);
}

const exportRequests = stub => stub.log.filter(u => u.startsWith('/export/csv'));

const CHECKS = {
  'fresh /access offers its own cause, with no prompt': async (stub, bundle) => {
    const page = open('/access', stub.origin, bundle);
    const btn = await waitFor(() => exportButton(page), 'Export');
    await waitFor(() => /Diseases of Heart/.test(btn.textContent), `Export to name the cause, saw "${btn.textContent}"`, 1500);
    btn.click();
    await waitFor(() => page.downloads.length, 'a download');
    assert(page.alerts.length === 0, 'alert() was used');
    assert(exportRequests(stub).at(-1) === '/export/csv?cause=Diseases_of_Heart', `requested ${exportRequests(stub).at(-1)}`);
    page.w.close();
  },

  'COVID-19 on Map, then Access, exports Diseases of Heart': async (stub, bundle) => {
    const page = open('/map', stub.origin, bundle);
    pick(page, await causeSelect(page), 'COVID_19');
    await waitFor(() => /COVID/.test(exportButton(page).textContent), 'Map cause on the button', 1500);
    exportButton(page).click();
    await waitFor(() => exportRequests(stub).at(-1) === '/export/csv?cause=COVID_19', 'the Map export');
    page.w.document.querySelector('a[href="/access"]').click();
    await waitFor(() => /Diseases of Heart/.test(exportButton(page).textContent), 'Access cause on the button', 1500);
    exportButton(page).click();
    await waitFor(() => exportRequests(stub).at(-1) === '/export/csv?cause=Diseases_of_Heart',
      `the Access export, saw ${exportRequests(stub).at(-1)}`);
    page.w.close();
  },

  'changing the cause on Access changes the export': async (stub, bundle) => {
    const page = open('/access', stub.origin, bundle);
    pick(page, await causeSelect(page), 'COVID_19');
    await waitFor(() => /COVID/.test(exportButton(page).textContent), 'new cause on the button', 1500);
    page.w.close();
  },

  'fresh /pulse exports the cause it shows': async (stub, bundle) => {
    const page = open('/pulse', stub.origin, bundle);
    const btn = await waitFor(() => exportButton(page), 'Export');
    await waitFor(() => /Total Deaths/i.test(btn.textContent), `Pulse cause on the button, saw "${btn.textContent}"`, 1500);
    btn.click();
    await waitFor(() => exportRequests(stub).at(-1) === '/export/csv?cause=Total_Deaths', 'the Pulse export');
    page.w.close();
  },

  'Providers exports provider rows, not death rates': async (stub, bundle) => {
    const page = open('/providers', stub.origin, bundle);
    const before = exportRequests(stub).length;
    const btn = await waitFor(() => {
      const b = exportButton(page);
      return b && !b.disabled && /Primary Care/.test(b.textContent) ? b : null;
    }, 'the provider export');
    btn.click();
    await waitFor(() => page.downloads.length, 'a download');
    assert(exportRequests(stub).length === before, 'Providers called the death rate export');
    assert(page.downloads[0] === 'idph_primary_care_physicians_per_100k_2022.csv', `filename ${page.downloads[0]}`);
    const lines = (await readBlob(page, page.blobs[0])).trim().split(/\r?\n/);
    assert(lines[0] === 'County,Primary Care Physicians /100k 2022', `header ${lines[0]}`);
    assert(lines.includes('ILLINOIS,81.5'), 'state row missing');
    assert(lines.includes('Adams,72.25'), 'county row missing');
    assert(lines.includes('Brown,0'), 'a true zero must stay 0');
    assert(lines.includes('Calhoun,'), 'a missing value must stay blank');
    assert(!lines.some(l => l.startsWith('Chicago')), 'Chicago is not a row this view displays');
    page.w.close();
  },

  'views with no single dataset disable Export and say why': async (stub, bundle) => {
    for (const route of ['/scorecard', '/', '/admin']) {
      const page = open(route, stub.origin, bundle);
      const btn = await waitFor(() => exportButton(page), 'Export');
      assert(btn.disabled, `${route}: Export is enabled`);
      assert(btn.title, `${route}: no reason given`);
      page.w.close();
    }
  },

  'Map with no cause disables Export until one is picked': async (stub, bundle) => {
    const page = open('/map', stub.origin, bundle);
    const btn = await waitFor(() => exportButton(page), 'Export');
    assert(btn.disabled && /cause/i.test(btn.title), 'Map without a cause should disable Export and say why');
    pick(page, await causeSelect(page), 'COVID_19');
    await waitFor(() => !exportButton(page).disabled, 'Export to enable', 1500);
    page.w.close();
  },

  'a failed export shows an inline message': async (stub, bundle) => {
    stub.state.failExport = true;
    const page = open('/access', stub.origin, bundle);
    const btn = await waitFor(() => {
      const b = exportButton(page);
      return b && !b.disabled ? b : null;
    }, 'Export');
    btn.click();
    const msg = await waitFor(() => page.w.document.querySelector('.topstrip [role="alert"]'), 'an inline error');
    assert(/Diseases of Heart/.test(msg.textContent), `message "${msg.textContent}"`);
    assert(page.alerts.length === 0, 'alert() was used');
    stub.state.failExport = false;
    page.w.close();
  },

  'the preset menu says Access and Pulse keep their own cause': async (stub, bundle) => {
    const page = open('/map', stub.origin, bundle);
    const presets = await waitFor(
      () => [...page.w.document.querySelectorAll('.topstrip button')].find(b => /Presets/.test(b.textContent)),
      'Presets',
    );
    presets.click();
    await waitFor(
      () => /Access and Pulse keep their own cause/.test(page.w.document.querySelector('.topstrip').textContent),
      'the preset note', 1500,
    );
    page.w.close();
  },
};

const bundle = loadBundle();
const stub = await startStub();
let failed = 0;
for (const [name, check] of Object.entries(CHECKS)) {
  try {
    await check(stub, bundle);
    console.log(`ok   ${name}`);
  } catch (e) {
    failed++;
    console.log(`FAIL ${name}\n       ${e.message}`);
  }
}
stub.server.close();
const total = Object.keys(CHECKS).length;
console.log(failed ? `\n${failed} of ${total} checks failed` : `\nAll ${total} checks passed`);
process.exit(failed ? 1 : 0);
