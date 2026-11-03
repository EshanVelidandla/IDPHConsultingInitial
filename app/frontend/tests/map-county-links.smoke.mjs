/**
 * Regression check for #33: a county link on the map must open a profile with
 * data, including when it is used right after choosing a cause, and a county
 * route must accept any capitalisation of the name.
 *
 * Like smoke.mjs this drives the production bundle in jsdom against a running
 * backend, so it is not part of `npm test`. jsdom does no layout, so county
 * paths have no shape here: this proves which link a path opens, not how the
 * map looks.
 *
 * Usage:
 *   npm run build
 *   # backend running on http://127.0.0.1:8000
 *   node tests/map-county-links.smoke.mjs
 */

import { JSDOM, VirtualConsole } from 'jsdom';
import fs from 'node:fs';
import path from 'node:path';

const UI = process.env.UI_DIR ?? '../backend/ui';
const ORIGIN = process.env.SMOKE_ORIGIN ?? 'http://127.0.0.1:8000';
const TIMEOUT_MS = Number(process.env.SMOKE_SETTLE_MS ?? 15000);

const html = fs.readFileSync(path.join(UI, 'index.html'), 'utf8');
const bundle = fs
  .readFileSync(path.join(UI, html.match(/src="([^"]+\.js)"/)[1].replace(/^\//, '')), 'utf8')
  .replace(/import\.meta/g, '({env:{}})');

function open(route) {
  const dom = new JSDOM(html, {
    runScripts: 'dangerously',
    url: ORIGIN + route,
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
  // Leaflet picks its SVG renderer by looking for this method, which jsdom lacks.
  w.SVGSVGElement.prototype.createSVGRect ??= () => ({});
  w.eval(bundle);
  return w;
}

async function until(check, what) {
  const start = Date.now();
  while (Date.now() - start < TIMEOUT_MS) {
    const value = check();
    if (value) return value;
    await new Promise(r => setTimeout(r, 50));
  }
  throw new Error(`timed out waiting for ${what}`);
}

const countyPaths = w => [...w.document.querySelectorAll('path[role="link"]')];
const countyPath = (w, name) => countyPaths(w).find(
  p => p.getAttribute('aria-label')?.toLowerCase() === `${name} county`.toLowerCase(),
);
const pageText = w => (w.document.getElementById('root')?.textContent ?? '').replace(/\s+/g, ' ');

/** The figure that read "n/a" on the empty profile. */
const profileHasData = w => /All-cause rate \/ 100k\s*[\d.]+/.test(pageText(w));

/** Choose a cause, leaving the rebuilt layers in place while its rates load. */
async function chooseCause(w, cause) {
  const select = await until(
    () => [...w.document.querySelectorAll('select')]
      .find(s => [...s.options].some(o => o.value === cause)),
    'the cause selector',
  );
  const before = countyPaths(w)[0];
  const setValue = Object.getOwnPropertyDescriptor(w.HTMLSelectElement.prototype, 'value').set;
  setValue.call(select, cause);
  select.dispatchEvent(new w.Event('change', { bubbles: true }));
  await until(() => countyPaths(w).length === 102 && countyPaths(w)[0] !== before, 'the layers to rebuild');
}

async function assertOpensProfile(w, activate) {
  const sangamon = await until(() => countyPath(w, 'Sangamon'), 'the Sangamon path');
  if (sangamon.getAttribute('aria-label') !== 'Sangamon County') {
    throw new Error(`aria-label is "${sangamon.getAttribute('aria-label')}"`);
  }
  activate(sangamon);
  await until(() => w.location.pathname.startsWith('/county/'), 'navigation to a profile');
  if (w.location.pathname !== '/county/Sangamon') throw new Error(`opened ${w.location.pathname}`);
  await until(() => profileHasData(w), 'profile data');
}

const CHECKS = [
  ['click right after choosing a cause', async w => {
    await until(() => countyPaths(w).length === 102, '102 county paths');
    await chooseCause(w, 'Diseases_of_Heart');
    await assertOpensProfile(w, p => p.dispatchEvent(
      new w.MouseEvent('click', { bubbles: true, cancelable: true, view: w }),
    ));
  }, '/map'],
  ['Enter right after choosing a cause', async w => {
    await until(() => countyPaths(w).length === 102, '102 county paths');
    await chooseCause(w, 'Diseases_of_Heart');
    await assertOpensProfile(w, p => p.dispatchEvent(
      new w.KeyboardEvent('keydown', { key: 'Enter', bubbles: true, cancelable: true }),
    ));
  }, '/map'],
  ['click with no cause chosen', async w => {
    await until(() => countyPaths(w).length === 102, '102 county paths');
    await assertOpensProfile(w, p => p.dispatchEvent(
      new w.MouseEvent('click', { bubbles: true, cancelable: true, view: w }),
    ));
  }, '/map'],
  ['upper-case route redirects and shows data', async w => {
    await until(() => w.location.pathname === '/county/Sangamon', 'the canonical URL');
    await until(() => profileHasData(w), 'profile data');
    if (w.history.length !== 1) throw new Error('redirect added a history entry');
  }, '/county/SANGAMON'],
  ['two-word name in lower case', async w => {
    await until(() => w.location.pathname === '/county/St.%20Clair', 'the canonical URL');
    await until(() => profileHasData(w), 'profile data');
  }, '/county/st.%20clair'],
  ['unknown name shows a message', async w => {
    await until(() => /No county named "Atlantis"/.test(pageText(w)), 'the not-found message');
  }, '/county/Atlantis'],
  ['Object.prototype key is not a county', async w => {
    await until(() => /No county named "constructor"/.test(pageText(w)), 'the not-found message');
  }, '/county/constructor'],
  ['stray percent sign does not blank the page', async w => {
    await until(() => /No county named "100%"/.test(pageText(w)), 'the not-found message');
  }, '/county/100%25'],
];

try {
  const res = await fetch(`${ORIGIN}/health`);
  if (!res.ok) throw new Error(String(res.status));
} catch {
  console.error(`Backend not reachable at ${ORIGIN}.`);
  process.exit(2);
}

let failed = 0;
for (const [name, check, route] of CHECKS) {
  let w;
  try {
    w = open(route);
    await check(w);
    console.log(`ok   ${name}`);
  } catch (e) {
    failed++;
    console.log(`FAIL ${name}: ${e.message}`);
  } finally {
    w?.close();
  }
}

console.log(failed ? `\n${failed} of ${CHECKS.length} checks failed` : `\nAll ${CHECKS.length} checks passed`);
process.exit(failed ? 1 : 0);
