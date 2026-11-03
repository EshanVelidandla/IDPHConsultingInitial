/**
 * Failed requests must reach the user (issue #11).
 *
 * Renders the built SPA in jsdom against a stub API, never the real backend,
 * so the failing deletes and writes below cannot touch any data. Each case
 * makes some requests fail and checks that a message appears and that nothing
 * becomes an unhandled rejection.
 *
 * Usage:
 *   npm run build
 *   node --test tests/failed-loads.test.mjs
 */

import { test, before, after } from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import http from 'node:http';
import path from 'node:path';
import { JSDOM, VirtualConsole } from 'jsdom';

const UI = process.env.UI_DIR ?? '../backend/ui';
const YEARS = Array.from({ length: 15 }, (_, i) => 2008 + i);

const rateRow = (County, rate) => ({ County, ...Object.fromEntries(YEARS.map(y => [y, rate])) });

/** What the API answers when a case does not say otherwise. */
const FIXTURES = {
  '/meta': { year_min: 2008, year_max: 2022, counties: ['DuPage'] },
  '/death_rates': [rateRow('ILLINOIS', 800), rateRow('DuPage', 700)],
  '/admin/datasets': [{ cause: 'Suicide', filename: 'Suicide.csv', size_kb: 4, modified: '2026-01-01T00:00:00Z' }],
  '/thresholds': [{ id: 't1', cause: 'Suicide', rate: 20, notify_email: null, created_by: 'admin', updated_at: '2026-01-01' }],
  '/presets': [{ id: 'p1', name: 'Saved view', cause: 'Suicide', year: 2022, district: null, is_public: true, created_by: 'admin', created_at: '2026-01-01' }],
  '/admin/users': [
    { id: '1', username: 'admin', name: 'Admin', role: 'admin', created_at: '2026-01-01' },
    { id: '2', username: 'jdoe', name: 'Jane Doe', role: 'viewer', created_at: '2026-01-01' },
  ],
  '/admin/audit': { entries: [], total: 0 },
};

const unhandled = [];
const onUnhandled = reason => unhandled.push(reason);

let server;
let origin;
let rule = () => null;

const { html, code } = (() => {
  const page = fs.readFileSync(path.join(UI, 'index.html'), 'utf8');
  const match = page.match(/src="([^"]+\.js)"/);
  if (!match) throw new Error(`No bundle referenced in ${UI}/index.html. Run npm run build.`);
  const bundle = fs
    .readFileSync(path.join(UI, match[1].replace(/^\//, '')), 'utf8')
    .replace(/import\.meta/g, '({env:{}})');
  return { html: page, code: bundle };
})();

before(async () => {
  process.on('unhandledRejection', onUnhandled);
  server = http.createServer((req, res) => {
    const url = new URL(req.url, 'http://stub');
    const forced = rule(req.method, url.pathname, url.search);
    const status = forced?.status ?? 200;
    const body = forced ? forced.body ?? { detail: 'stub failure' } : FIXTURES[url.pathname] ?? [];
    res.writeHead(status, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify(body));
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  origin = `http://127.0.0.1:${server.address().port}`;
});

after(async () => {
  process.off('unhandledRejection', onUnhandled);
  server.closeAllConnections();
  await new Promise(resolve => server.close(resolve));
});

function render(route) {
  const dom = new JSDOM(html, {
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
  w.confirm = () => true;
  w.eval(code);
  return w;
}

const textOf = w => (w.document.getElementById('root')?.textContent ?? '').replace(/\s+/g, ' ');
const alertsOf = w => [...w.document.querySelectorAll('[role="alert"]')].map(a => a.textContent);

async function until(check, what, w) {
  const deadline = Date.now() + 5000;
  while (Date.now() < deadline) {
    if (check()) return;
    await new Promise(resolve => setTimeout(resolve, 25));
  }
  assert.fail(`Timed out waiting for ${what}. Page text: ${textOf(w).slice(0, 400)}`);
}

function button(w, label) {
  const found = [...w.document.querySelectorAll('button')].filter(b => b.textContent.trim() === label);
  assert.ok(found.length, `No button labelled ${label}`);
  return found[found.length - 1];
}

const settle = () => new Promise(resolve => setTimeout(resolve, 100));

/** Set a controlled input or select the way React expects to see it change. */
function fill(w, el, value) {
  const proto = el.tagName === 'SELECT' ? w.HTMLSelectElement.prototype : w.HTMLInputElement.prototype;
  Object.getOwnPropertyDescriptor(proto, 'value').set.call(el, value);
  el.dispatchEvent(new w.Event(el.tagName === 'SELECT' ? 'change' : 'input', { bubbles: true }));
}

async function run(route, failRule, body) {
  rule = failRule;
  unhandled.length = 0;
  const w = render(route);
  try {
    await body(w);
    await settle();
    assert.deepEqual(unhandled.map(String), [], 'unhandled rejection');
  } finally {
    rule = () => null;
    w.close();
  }
}

// ── County profile ───────────────────────────────────────────

test('county profile says so when every cause fails', () =>
  run('/county/DuPage', (_m, p) => (p === '/death_rates' ? { status: 502 } : null), async w => {
    await until(() => /Could not load county data/.test(textOf(w)), 'the all-failed message', w);
  }));

test('county profile lists the causes that failed and keeps the rest', () =>
  run('/county/DuPage', (_m, p, q) => (p === '/death_rates' && q.includes('cause=Intentional_Self_Harm') ? { status: 502 } : null), async w => {
    await until(() => alertsOf(w).some(a => a.includes('Could not load')), 'the missing-cause banner', w);
    const banner = alertsOf(w).find(a => a.includes('Could not load'));
    assert.match(banner, /Suicide/);
    assert.doesNotMatch(banner, /Total Deaths/i);
    assert.match(textOf(w), /DuPage County/);
    assert.match(textOf(w), /Cause breakdown/);
  }));

test('county profile shows no banner when everything loads', () =>
  run('/county/DuPage', () => null, async w => {
    await until(() => /Cause breakdown/.test(textOf(w)), 'the profile', w);
    assert.equal(alertsOf(w).filter(a => a.includes('Could not load')).length, 0);
  }));

// ── Admin loads ──────────────────────────────────────────────

const TABS = [
  ['Data', '/admin/datasets', 'No CSV files found'],
  ['Annotations', '/annotations', 'No annotations yet'],
  ['Thresholds', '/thresholds', 'No thresholds configured'],
  ['Presets', '/presets', 'No presets saved'],
  ['Users', '/admin/users', null],
  ['Audit Log', '/admin/audit', 'No audit entries yet'],
];

for (const [tab, endpoint, emptyText] of TABS) {
  test(`admin ${tab} tab reports a failed load`, () =>
    run('/admin', (_m, p) => (p === endpoint ? { status: 502 } : null), async w => {
      await until(() => /System management/.test(textOf(w)), 'the admin panel', w);
      button(w, tab).click();
      await until(() => alertsOf(w).length > 0, `an alert on the ${tab} tab`, w);
      assert.ok(alertsOf(w).some(a => /stub failure/.test(a)), `alerts: ${alertsOf(w)}`);
      if (emptyText) assert.doesNotMatch(textOf(w), new RegExp(emptyText));
    }));
}

test('admin recovers when a refresh succeeds after a failed load', () => {
  let fail = true;
  return run('/admin', (_m, p) => (fail && p === '/admin/datasets' ? { status: 502 } : null), async w => {
    await until(() => alertsOf(w).length > 0, 'the load error', w);
    fail = false;
    button(w, 'Refresh').click();
    await until(() => /4 KB/.test(textOf(w)) && alertsOf(w).length === 0, 'the error to clear', w);
  });
});

// ── Admin mutations ──────────────────────────────────────────

// A different message per method, so one failure cannot pass for another.
const failWrites = m => (m === 'GET' ? null : { status: 500, body: { detail: `${m} failed` } });

test('admin dataset delete failure is shown', () =>
  run('/admin', failWrites, async w => {
    await until(() => /4 KB/.test(textOf(w)), 'the dataset row', w);
    button(w, 'Delete').click();
    await until(() => /DELETE failed/.test(textOf(w)), 'the delete error', w);
  }));

test('admin threshold delete failure is shown', () =>
  run('/admin', failWrites, async w => {
    await until(() => /System management/.test(textOf(w)), 'the admin panel', w);
    button(w, 'Thresholds').click();
    await until(() => /> 20/.test(textOf(w)), 'the threshold row', w);
    button(w, 'Delete').click();
    await until(() => /DELETE failed/.test(textOf(w)), 'the delete error', w);
  }));

test('admin preset delete and save failures are shown', () =>
  run('/admin', failWrites, async w => {
    await until(() => /System management/.test(textOf(w)), 'the admin panel', w);
    button(w, 'Presets').click();
    await until(() => /Saved view/.test(textOf(w)), 'the preset row', w);
    button(w, 'Del').click();
    await until(() => /DELETE failed/.test(textOf(w)), 'the delete error', w);

    const form = w.document.querySelector('form');
    fill(w, form.querySelector('input.inp'), 'New preset');
    fill(w, form.querySelector('select'), 'Intentional_Self_Harm');
    await settle();
    form.dispatchEvent(new w.Event('submit', { bubbles: true, cancelable: true }));
    await until(() => /POST failed/.test(textOf(w)), 'the save error', w);
    assert.equal(form.querySelector('input.inp').value, 'New preset', 'the form must keep its values when saving fails');
  }));

test('admin user role and delete failures are shown', () =>
  run('/admin', failWrites, async w => {
    await until(() => /System management/.test(textOf(w)), 'the admin panel', w);
    button(w, 'Users').click();
    await until(() => /jdoe/.test(textOf(w)), 'the user rows', w);

    button(w, 'Delete').click();
    await until(() => /DELETE failed/.test(textOf(w)), 'the delete error', w);

    w.document.querySelector('button[aria-label="Change role for jdoe"]').click();
    await until(() => /Cancel/.test(textOf(w)), 'the role editor', w);
    button(w, 'Save').click();
    await until(() => /PUT failed/.test(textOf(w)), 'the role error', w);
    assert.ok(button(w, 'Cancel'), 'the role editor must stay open when saving fails');
  }));

// ── Pulse ────────────────────────────────────────────────────

test('Pulse puts the baseline event on the first data year', () =>
  run('/pulse', () => null, async w => {
    await until(() => /Baseline/.test(textOf(w)), 'the baseline label', w);

    // The mini-map tiles are the one control here that jsdom can drive without
    // layout.
    const tile = year => w.document.querySelector(`[aria-label="Show ${year} map"]`);

    tile(2008).click();
    await until(() => /Baseline year/.test(textOf(w)), 'the 2008 event text', w);
    tile(2009).click();
    await until(() => /No annotated event for 2009/.test(textOf(w)), '2009 to have no event', w);
  }));
