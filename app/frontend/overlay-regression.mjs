/**
 * Regression test for the loading overlay that stayed on screen (issue #25).
 *
 * Map, Insights and Priority each set `loading` and let only the live request
 * clear it. Clearing the cause while a request is in flight cancels that
 * request, and the next effect run returned early, so nothing cleared it. On
 * the Map the overlay also blocked clicks on the counties.
 *
 * This renders the real production bundle in jsdom against a small stub server
 * that answers /death_rates slowly, so the request is reliably in flight. It
 * needs no backend and no data files. Layout and click targets are out of reach
 * here, so it checks that the overlay element is gone, not what a click hits.
 *
 * Usage:
 *   npm run build
 *   node overlay-regression.mjs
 */

import { JSDOM, VirtualConsole } from 'jsdom';
import fs from 'node:fs';
import http from 'node:http';
import path from 'node:path';

const UI = process.env.UI_DIR ?? '../backend/ui';
const RESPONSE_DELAY_MS = 300;
const ROUTES = ['/map', '/insights', '/priority'];
const HAS_EMPTY_STATE = new Set(['/insights', '/priority']);
const CAUSE = 'Malignant_Neoplasms';

const sleep = ms => new Promise(r => setTimeout(r, ms));

function loadBundle() {
  const html = fs.readFileSync(path.join(UI, 'index.html'), 'utf8');
  const match = html.match(/src="([^"]+\.js)"/);
  if (!match) throw new Error(`No bundle referenced in ${UI}/index.html. Run npm run build.`);
  const code = fs
    .readFileSync(path.join(UI, match[1].replace(/^\//, '')), 'utf8')
    // jsdom cannot eval ES module syntax; the bundle uses import.meta only for env.
    .replace(/import\.meta/g, '({env:{}})');
  return { html, code };
}

function startStub() {
  const server = http.createServer((req, res) => {
    const { pathname } = new URL(req.url, 'http://stub');
    let body = [];
    if (pathname === '/meta') {
      body = { year_min: 2008, year_max: 2022, counties: [], provider_metrics: {} };
    } else if (pathname === '/geojson') {
      body = { type: 'FeatureCollection', features: [] };
    } else if (pathname === '/death_rates') {
      body = [{ County: 'ILLINOIS', 2022: 100 }];
    }
    const delay = pathname === '/death_rates' ? RESPONSE_DELAY_MS : 0;
    setTimeout(() => {
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify(body));
    }, delay);
  });
  return new Promise(resolve => {
    server.listen(0, '127.0.0.1', () => resolve(server));
  });
}

function openRoute(origin, route, html, code) {
  const dom = new JSDOM(html, {
    runScripts: 'dangerously',
    resources: 'usable',
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
  w.eval(code);
  return dom;
}

const causeSelect = doc =>
  [...doc.querySelectorAll('select')].find(s =>
    [...s.options].some(o => o.value === '' && o.textContent === 'Select a cause'));

function choose(w, select, value) {
  select.value = value;
  select.dispatchEvent(new w.Event('change', { bubbles: true }));
}

const overlayShown = doc =>
  [...doc.querySelectorAll('.loading-center')].some(el => /Loading/.test(el.textContent));

async function check(origin, route, html, code) {
  const dom = openRoute(origin, route, html, code);
  const w = dom.window;
  const doc = w.document;
  const problems = [];
  try {
    let select;
    for (let i = 0; i < 100 && !select; i++) {
      await sleep(50);
      select = causeSelect(doc);
    }
    if (!select) return ['no cause select rendered'];
    if (overlayShown(doc)) problems.push('overlay shown before any cause was chosen');

    // The stuck case: choose a cause, then clear it while the request is in flight.
    choose(w, select, CAUSE);
    await sleep(RESPONSE_DELAY_MS / 3);
    if (!overlayShown(doc)) problems.push('overlay never appeared, so the request was not in flight');
    choose(w, causeSelect(doc), '');
    await sleep(RESPONSE_DELAY_MS * 2);
    if (overlayShown(doc)) problems.push('overlay still shown after clearing the cause');
    // Priority hides its spinner with the chart, so its symptom is a blank view
    // rather than an overlay: the empty state waits on `loading` as well.
    if (HAS_EMPTY_STATE.has(route) && !doc.querySelector('.empty-title')) {
      problems.push('empty state missing after clearing the cause');
    }

    // The normal path must still work: the cached response lands and clears it.
    choose(w, causeSelect(doc), CAUSE);
    await sleep(RESPONSE_DELAY_MS * 2);
    if (overlayShown(doc)) problems.push('overlay still shown after a cause finished loading');
  } finally {
    w.close();
  }
  return problems;
}

const { html, code } = loadBundle();
const server = await startStub();
const origin = `http://127.0.0.1:${server.address().port}`;

let failed = 0;
for (const route of ROUTES) {
  const problems = await check(origin, route, html, code);
  if (problems.length) failed++;
  console.log(`${problems.length ? 'FAIL' : 'ok  '} ${route.padEnd(10)} ${problems.join('; ')}`);
}

server.close();
console.log(failed ? `\n${failed} of ${ROUTES.length} routes failed` : `\nAll ${ROUTES.length} routes clear the overlay`);
process.exit(failed ? 1 : 0);
