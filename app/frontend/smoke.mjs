/**
 * Render every route of the built SPA and fail on console errors.
 *
 * There is no component test suite, and several regressions in this app only
 * showed up at runtime: a view that threw inside render blanked the whole
 * page while the build and the typecheck both passed. This renders the real
 * production bundle in jsdom against a running backend and checks that each
 * route mounts, produces a plausible amount of content, and logs nothing.
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
 */

import { JSDOM, VirtualConsole } from 'jsdom';
import fs from 'node:fs';
import path from 'node:path';

const UI = process.env.UI_DIR ?? '../backend/ui';
const ORIGIN = process.env.SMOKE_ORIGIN ?? 'http://127.0.0.1:8000';
const SETTLE_MS = Number(process.env.SMOKE_SETTLE_MS ?? 5000);

/** Route, and the minimum rendered characters that means "it actually filled in". */
const ROUTES = [
  ['/', 900],
  ['/insights', 900],
  ['/scorecard', 2000],
  ['/priority', 900],
  ['/pulse', 1200],
  ['/providers', 1500],
  ['/access', 1500],
  ['/admin', 800],
  ['/county/DuPage', 1200],
];

// jsdom has no canvas or layout engine, so these are noise rather than faults.
const IGNORE = /Could not parse CSS|Not implemented|Could not load link|canvas/i;

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

async function render(route, html, code) {
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
    url: ORIGIN + route,
    virtualConsole,
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

  try {
    w.eval(code);
  } catch (e) {
    messages.push('THROWN ' + (e.stack || e.message));
  }

  await new Promise(r => setTimeout(r, SETTLE_MS));
  const root = w.document.getElementById('root');
  const text = (root?.textContent ?? '').replace(/\s+/g, ' ').trim();
  dom.window.close();
  return { chars: text.length, errors: messages.filter(m => !IGNORE.test(m)) };
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

let failed = 0;
for (const [route, minChars] of ROUTES) {
  const { chars, errors } = await render(route, html, code);
  const problems = [];
  if (chars === 0) problems.push('did not mount');
  else if (chars < minChars) problems.push(`only ${chars} chars, expected >= ${minChars}`);
  if (errors.length) problems.push(`${errors.length} console error(s)`);

  if (problems.length) {
    failed++;
    console.log(`FAIL ${route.padEnd(18)} ${problems.join('; ')}`);
    if (errors.length) console.log('       ' + errors[0].split('\n').slice(0, 2).join('\n       ').slice(0, 400));
  } else {
    console.log(`ok   ${route.padEnd(18)} ${chars} chars`);
  }
}

console.log(failed ? `\n${failed} of ${ROUTES.length} routes failed` : `\nAll ${ROUTES.length} routes rendered cleanly`);
process.exit(failed ? 1 : 0);
