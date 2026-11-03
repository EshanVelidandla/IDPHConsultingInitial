/**
 * Render every route of the built SPA and fail unless real data reached it.
 *
 * There is no component test suite, and several regressions in this app only
 * showed up at runtime: a view that threw inside render blanked the whole
 * page while the build and the typecheck both passed. This renders the real
 * production bundle in jsdom against a running backend. A route passes only if
 * all of these hold:
 *   - it mounts and produces a plausible amount of content;
 *   - it logs no console errors and raises no unhandled rejection or exception;
 *   - no request hit a network error or a status >= 500;
 *   - its data assertion holds. Character counts alone cannot show this, since
 *     option labels and static copy clear them with the backend's data absent.
 *
 * Every route has a data assertion; see `check` in ROUTES. Where jsdom cannot
 * show the real thing (chart marks), the assertion uses text that only exists
 * after the data loads.
 *
 * Two things it cannot see, both worth knowing before trusting a pass:
 *   - Layout. jsdom does no layout, so this catches "the page is broken",
 *     never "the page looks wrong".
 *   - Charts. Recharts renders through ResponsiveContainer, which measures its
 *     parent; in jsdom that measures zero, so no chart marks exist in any
 *     route here. Chart code is therefore unexercised by this test.
 *
 * Usage:
 *   npm run build
 *   # backend running on http://127.0.0.1:8000
 *   npm run smoke
 *
 * Environment:
 *   SMOKE_ORIGIN      backend origin
 *   SMOKE_SETTLE_MS   wait after load, and again after a route's action
 *   SMOKE_FAIL        regex on path and query; matching requests go to a closed
 *                     port. SMOKE_FAIL='.*' must fail every route, which is how
 *                     to check that this script can still detect failure.
 *
 * Exit codes: 0 all routes passed, 1 something failed, 2 backend unreachable.
 */

import { JSDOM, VirtualConsole } from 'jsdom';
import fs from 'node:fs';
import net from 'node:net';
import path from 'node:path';

const UI = process.env.UI_DIR ?? '../backend/ui';
const ORIGIN = process.env.SMOKE_ORIGIN ?? 'http://127.0.0.1:8000';
const SETTLE_MS = Number(process.env.SMOKE_SETTLE_MS ?? 5000);
const FAIL = process.env.SMOKE_FAIL ? new RegExp(process.env.SMOKE_FAIL) : null;

/** Pick an option in the first select offering it, the way a user's change does. */
function choose(w, optionText) {
  const select = [...w.document.querySelectorAll('select')].find(s =>
    [...s.options].some(o => o.textContent === optionText));
  if (!select) throw new Error(`no select offers "${optionText}"`);
  const option = [...select.options].find(o => o.textContent === optionText);
  // React tracks the value property, so set it through the native setter.
  Object.getOwnPropertyDescriptor(w.HTMLSelectElement.prototype, 'value').set.call(select, option.value);
  select.dispatchEvent(new w.Event('change', { bubbles: true }));
}

const pickCause = w => choose(w, 'Total Deaths');

const needs = (ok, what) => (ok ? null : `no data: ${what}`);

const tableRows = doc => doc.querySelectorAll('tbody tr').length;

const heading = doc => doc.querySelector('h1')?.textContent?.trim();

/** County shapes, and how many different fills they use: one means nothing was shaded. */
function shadedCounties(doc) {
  const fills = [...doc.querySelectorAll('path.leaflet-interactive')].map(p => p.getAttribute('fill'));
  return { paths: fills.length, distinct: new Set(fills).size };
}

/**
 * path, minChars: minimum rendered characters that means "it actually filled in".
 * action(window): optional step after the first settle, followed by another settle.
 * check({ doc, text, requests }): returns a problem string, or null when the data
 * arrived. requests maps each pathname to how many requests it received.
 */
const ROUTES = [
  // The page itself is static copy. The sidebar's year range comes from /meta.
  { path: '/', minChars: 900,
    check: ({ text, metaBody }) => needs(/"year_min":\s*\d{4}/.test(metaBody ?? '') && /Years\s*\d{4} – \d{4}/.test(text), 'year range from /meta') },
  { path: '/map', minChars: 900, action: pickCause,
    check: ({ doc }) => {
      const { paths, distinct } = shadedCounties(doc);
      return needs(paths === 102 && distinct > 1, `${paths} county paths with ${distinct} fill(s), expected 102 with several`);
    } },
  { path: '/insights', minChars: 900, action: pickCause,
    check: ({ text }) => needs(/Highest county rate\d/.test(text), 'highest county rate') },
  { path: '/scorecard', minChars: 2000,
    check: ({ doc }) => needs(tableRows(doc) === 102, `${tableRows(doc)} table rows, expected 102`) },
  { path: '/priority', minChars: 900, action: pickCause,
    check: ({ text }) => needs(/Priority counties[1-9]/.test(text), 'priority county count') },
  { path: '/pulse', minChars: 1200,
    check: ({ text }) => needs(/\b102 IL counties shown/.test(text) && /\D15 mini-maps/.test(text),
      '102 counties and 15 mini-maps') },
  { path: '/providers', minChars: 1500,
    check: ({ doc }) => needs(tableRows(doc) === 20, `${tableRows(doc)} table rows, expected 20`) },
  { path: '/access', minChars: 1500,
    check: ({ text }) => needs(/Well-served[1-9]/.test(text), 'county count in a quadrant') },
  { path: '/admin', minChars: 800,
    check: ({ doc, text }) => needs(/\D[1-9]\d* cause files on disk/.test(text) && tableRows(doc) > 0, 'dataset rows') },
  { path: '/county/DuPage', minChars: 1200,
    check: ({ doc, text }) => needs(heading(doc) === 'DuPage County' && /Population [\d,]+/.test(text) && /All-cause rate \/ 100k\d/.test(text),
      'heading, population and all-cause rate') },
  // Case-insensitive route: the canonical page, with data.
  { path: '/county/SANGAMON', minChars: 1200,
    check: ({ doc, text }) => needs(heading(doc) === 'Sangamon County' && /All-cause rate \/ 100k\s*[\d.]+/.test(text), 'Sangamon County page with data') },
  // Cook's two IDPH reporting units are reached from its profile, and are not counties.
  { path: '/county/Cook', minChars: 1200,
    check: ({ doc, text }) => needs(heading(doc) === 'Cook County' && text.includes('Suburban Cook') && /All-cause rate \/ 100k\d/.test(text), 'Cook heading, link to its units and data') },
  { path: '/county/Chicago', minChars: 1200,
    check: ({ doc, text }) => needs(heading(doc) === 'Chicago' && text.includes('reported for Cook County only'), 'Chicago unit heading and provider note') },
];

// jsdom has no canvas or layout engine, so these are noise rather than faults.
const IGNORE = /Could not parse CSS|Not implemented|Could not load link|canvas/i;

// The route being rendered. A crash in the page's async code surfaces at the
// process level, so it is charged to this route rather than ending the run. One
// that lands between routes still fails the run.
let current = null;
const unattributed = [];
function recordCrash(kind, reason) {
  const line = `${kind}: ${(reason && reason.stack) || reason}`;
  if (current) current.crashes.push(line);
  else unattributed.push(line);
}
process.on('unhandledRejection', reason => recordCrash('unhandled rejection', reason));
process.on('uncaughtException', err => recordCrash('uncaught exception', err));

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

/** A port nothing is listening on, for SMOKE_FAIL to send requests to. */
function closedPort() {
  return new Promise((resolve, reject) => {
    const server = net.createServer();
    server.on('error', reject);
    server.listen(0, '127.0.0.1', () => {
      const { port } = server.address();
      server.close(() => resolve(port));
    });
  });
}

/** Count every XHR, record failures, and apply SMOKE_FAIL. axios uses XHR here. */
function watchRequests(w, state, deadPort, failUrl) {
  w.XMLHttpRequest = class extends w.XMLHttpRequest {
    open(method, url, ...rest) {
      const target = new w.URL(url, w.location.href);
      const where = target.pathname + target.search;
      state.requests.set(target.pathname, (state.requests.get(target.pathname) ?? 0) + 1);
      this.addEventListener('load', () => { if (target.pathname === '/meta') state.metaBody = String(this.responseText); });
      const failed = why => { if (!state.closed) state.failedRequests.push(`${method} ${where} ${why}`); };
      this.addEventListener('error', () => failed('network error'));
      this.addEventListener('timeout', () => failed('timed out'));
      this.addEventListener('load', () => { if (this.status >= 500) failed(`status ${this.status}`); });
      const down = FAIL?.test(where) || (failUrl && target.pathname === failUrl);
      const sent = down ? `http://127.0.0.1:${deadPort}${where}` : url;
      return super.open(method, sent, ...rest);
    }
  };
}

const settle = () => new Promise(r => setTimeout(r, SETTLE_MS));

async function render(route, html, code, deadPort, { failUrl, inspect } = {}) {
  const state = {
    crashes: [], failedRequests: [], requests: new Map(), problems: [], closed: false,
  };
  current = state;

  const messages = [];
  const virtualConsole = new VirtualConsole();
  for (const event of ['jsdomError', 'error']) {
    virtualConsole.on(event, (...args) =>
      messages.push(args.map(a => (a && a.stack) || String(a)).join(' ')),
    );
  }

  const dom = new JSDOM(html, {
    runScripts: 'dangerously',
    resources: 'usable',
    url: ORIGIN + route.path,
    virtualConsole,
    pretendToBeVisual: true,
    beforeParse: w => watchRequests(w, state, deadPort, failUrl),
  });
  const w = dom.window;
  w.matchMedia ??= () => ({
    matches: false, media: '',
    addListener() {}, removeListener() {},
    addEventListener() {}, removeEventListener() {},
  });
  w.ResizeObserver ??= class { observe() {} unobserve() {} disconnect() {} };
  w.scrollTo = () => {};

  try {
    w.eval(code);
  } catch (e) {
    messages.push('THROWN ' + (e.stack || e.message));
  }

  await settle();
  if (route.action) {
    try {
      route.action(w);
    } catch (e) {
      state.problems.push(`action failed: ${e.message}`);
    }
    await settle();
  }

  const root = w.document.getElementById('root');
  const text = (root?.textContent ?? '').replace(/\s+/g, ' ').trim();
  if (text.length > 0) {
    try {
      const problem = route.check({ doc: w.document, text, requests: state.requests, metaBody: state.metaBody });
      if (problem) state.problems.push(problem);
    } catch (e) {
      state.problems.push(`data assertion threw: ${e.message}`);
    }
  }
  const inspected = inspect ? await inspect(w, text) : undefined;
  state.closed = true;
  dom.window.close();
  current = null;
  return { ...state, chars: text.length, errors: messages.filter(m => !IGNORE.test(m)), inspected };
}

const { html, code } = loadBundle();

// Fail fast with a clear message rather than reporting nine empty routes.
try {
  const res = await fetch(`${ORIGIN}/health`);
  if (!res.ok) throw new Error(String(res.status));
} catch {
  console.error(`Backend not reachable at ${ORIGIN}. Start it first:\n` +
    `  cd app/backend && python -m uvicorn main:app --port 8000`);
  process.exit(2);
}

const deadPort = await closedPort();

let failed = 0;
for (const route of ROUTES) {
  const problems = [];
  let result = null;
  try {
    result = await render(route, html, code, deadPort);
  } catch (e) {
    current = null;
    problems.push(`render threw: ${e.message}`);
  }
  let detail = null;
  if (result) {
    const { chars, errors, crashes, failedRequests } = result;
    if (chars === 0) problems.push('did not mount');
    else if (chars < route.minChars) problems.push(`only ${chars} chars, expected >= ${route.minChars}`);
    problems.push(...result.problems);
    if (failedRequests.length) problems.push(`${failedRequests.length} failed request(s), first: ${failedRequests[0]}`);
    if (crashes.length) problems.push(`${crashes.length} crash(es)`);
    if (errors.length) problems.push(`${errors.length} console error(s)`);
    detail = crashes[0] ?? errors[0] ?? null;
  }

  if (problems.length) {
    failed++;
    console.log(`FAIL ${route.path.padEnd(18)} ${problems.join('; ')}`);
    if (detail) console.log('       ' + detail.split('\n').slice(0, 2).join('\n       ').slice(0, 400));
  } else {
    const total = [...result.requests.values()].reduce((a, b) => a + b, 0);
    console.log(`ok   ${route.path.padEnd(18)} ${result.chars} chars, ${total} requests`);
  }
}

console.log(failed ? `
${failed} of ${ROUTES.length} routes failed` : `
All ${ROUTES.length} routes rendered with data`);

// ── Behaviour checks: each inspect returns a problem string, or '' when fine ──

const crumb = w => w.document.querySelector('.topstrip .crumb .eyebrow-ink')?.textContent ?? '';

async function openAnnotations(w) {
  const tab = [...w.document.querySelectorAll('button')].find(b => b.textContent.trim() === 'Annotations');
  if (!tab) return null;
  tab.dispatchEvent(new w.MouseEvent('click', { bubbles: true }));
  await new Promise(r => setTimeout(r, 1000));
  return [...w.document.querySelectorAll('select')].find(s => s.options[0]?.textContent.match(/count/i)) ?? null;
}

const CHECKS = [
  ['/admin crumb', '/admin', {
    inspect: w => (crumb(w) === 'Admin' ? '' : `crumb is "${crumb(w)}"`),
  }],
  ['/county crumb', '/county/DuPage', {
    inspect: w => (crumb(w) === 'County profile' ? '' : `crumb is "${crumb(w)}"`),
  }],
  ['/nope not-found page', '/nope', {
    inspect: (w, text) => {
      if (crumb(w) !== 'Not found') return `crumb is "${crumb(w)}"`;
      return w.document.querySelector('.not-found') && text.includes('Page not found') ? '' : 'no not-found page';
    },
  }],
  ['/pulse aria-valuetext ignores hover', '/pulse', {
    inspect: async w => {
      const input = w.document.querySelector('input.tl-input');
      if (!input) return 'no slider';
      const selected = input.value;
      const before = input.getAttribute('aria-valuetext');
      if (!before.startsWith(selected)) return `valuetext "${before}" for year ${selected}`;
      // jsdom has no layout, so give the track a width for the hover maths.
      input.closest('.tl').getBoundingClientRect = () => ({ left: 0, width: 1000 });
      for (const clientX of [28, 200, 500, 800, 972]) {
        input.dispatchEvent(new w.MouseEvent('mouseover', { bubbles: true, clientX }));
        input.dispatchEvent(new w.MouseEvent('mousemove', { bubbles: true, clientX }));
        await new Promise(r => setTimeout(r, 50));
        const now = input.getAttribute('aria-valuetext');
        if (now !== before) return `hover changed valuetext to "${now}"`;
      }
      return '';
    },
  }],
  ['annotation county select with /meta down', '/admin', {
    failUrl: '/meta',
    inspect: async w => {
      const select = await openAnnotations(w);
      if (!select) return 'no county select';
      if (!select.disabled) return 'select is not disabled';
      return w.document.body.textContent.includes('county list could not be loaded') ? '' : 'no message';
    },
  }],
  ['annotation county select with /meta up', '/admin', {
    inspect: async w => {
      const select = await openAnnotations(w);
      if (!select) return 'no county select';
      return !select.disabled && select.options.length > 100 ? '' : `disabled=${select.disabled}, ${select.options.length} options`;
    },
  }],
];

// These need a healthy backend, so a failing run reports the routes alone.
let checksFailed = 0;
if (!FAIL && !failed) {
  for (const [name, path, options] of CHECKS) {
    const route = { path, minChars: 0, check: () => null };
    const { inspected } = await render(route, html, code, deadPort, options);
    if (inspected) {
      checksFailed++;
      console.log(`FAIL ${name}: ${inspected}`);
    } else {
      console.log(`ok   ${name}`);
    }
  }
}

// Let a late rejection from the last route land before the verdict.
await new Promise(r => setTimeout(r, 50));
if (unattributed.length) {
  console.log(`FAIL ${unattributed.length} crash(es) between routes, first: ${unattributed[0].split('\n')[0]}`);
}

process.exit(failed || checksFailed || unattributed.length ? 1 : 0);
