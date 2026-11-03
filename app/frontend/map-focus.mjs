/**
 * Keyboard focus on map counties, against the built SPA in jsdom.
 *
 * Leaflet's bringToFront is parent.appendChild(el), and moving a focused
 * element in the DOM drops focus to <body>. That made Enter, blur and the tab
 * order all fail on every county but the last. This drives the real bundle so
 * a reorder coming back on focus or hover fails here.
 *
 * jsdom does no layout and has no :focus-visible painting, so this says nothing
 * about how the focus style looks.
 *
 * Usage:
 *   npm run build
 *   # backend running on http://127.0.0.1:8000
 *   node map-focus.mjs
 */

import { JSDOM, VirtualConsole } from 'jsdom';
import fs from 'node:fs';
import path from 'node:path';

const UI = process.env.UI_DIR ?? '../backend/ui';
const ORIGIN = process.env.SMOKE_ORIGIN ?? 'http://127.0.0.1:8000';
const TIMEOUT_MS = Number(process.env.SMOKE_SETTLE_MS ?? 15000);

try {
  const res = await fetch(`${ORIGIN}/health`);
  if (!res.ok) throw new Error(String(res.status));
} catch {
  console.error(`Backend not reachable at ${ORIGIN}.`);
  process.exit(2);
}

const html = fs.readFileSync(path.join(UI, 'index.html'), 'utf8');
const bundle = html.match(/src="([^"]+\.js)"/);
if (!bundle) throw new Error(`No bundle referenced in ${UI}/index.html. Run npm run build.`);
const code = fs
  .readFileSync(path.join(UI, bundle[1].replace(/^\//, '')), 'utf8')
  .replace(/import\.meta/g, '({env:{}})');

const dom = new JSDOM(html, {
  runScripts: 'dangerously',
  resources: 'usable',
  url: `${ORIGIN}/map`,
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
// Leaflet feature-tests this to pick SVG over canvas, and jsdom does not have it.
w.SVGSVGElement.prototype.createSVGRect = () => ({});
w.eval(code);

const counties = () => [...w.document.querySelectorAll('path[tabindex="0"]')];
const order = () => counties().map(p => p.getAttribute('aria-label')).join('|');
const tooltips = () => w.document.querySelectorAll('.leaflet-tooltip').length;

const deadline = Date.now() + TIMEOUT_MS;
while (counties().length < 102 && Date.now() < deadline) {
  await new Promise(r => setTimeout(r, 100));
}

let failed = 0;
function check(name, ok, detail = '') {
  if (!ok) failed++;
  console.log(`${ok ? 'ok  ' : 'FAIL'} ${name}${!ok && detail ? ` (${detail})` : ''}`);
}

check('102 counties are tab stops', counties().length === 102, `${counties().length}`);
if (counties().length < 2) {
  console.log('\nNo county paths rendered, stopping.');
  w.close();
  process.exit(1);
}

const hover = el => el.dispatchEvent(new w.MouseEvent('mouseover', { bubbles: true }));
const label = el => el?.getAttribute?.('aria-label') ?? el?.tagName;

// Not the last path: the last one never moved, which is what hid this bug.
const [first, second] = counties();
const before = order();

first.focus();
check('focus holds on the county', w.document.activeElement === first, label(w.document.activeElement));
check('focus does not reorder the DOM', order() === before);
check('focus opens the tooltip', tooltips() === 1, `${tooltips()} open`);

hover(first);
check('hovering the focused county keeps focus', w.document.activeElement === first, label(w.document.activeElement));
check('hovering the focused county does not reorder', order() === before);

second.focus();
check('moving focus closes the previous tooltip', tooltips() === 1, `${tooltips()} open`);
check('focus moves to the next county', w.document.activeElement === second, label(w.document.activeElement));

second.blur();
check('blur closes the tooltip', tooltips() === 0, `${tooltips()} open`);

// Hover must still raise a county the keyboard is not on, or its thick stroke
// sits under its neighbours.
const target = counties()[3];
hover(target);
check('hovering an unfocused county still raises it', counties().at(-1) === target, label(counties().at(-1)));
target.dispatchEvent(new w.MouseEvent('mouseout', { bubbles: true }));

// The layer must survive a data change, or the focused county is destroyed.
const held = counties()[1];
held.focus();
const slider = w.document.querySelector('input[type="range"]');
const setRange = Object.getOwnPropertyDescriptor(w.HTMLInputElement.prototype, 'value').set;
setRange.call(slider, '2015');
slider.dispatchEvent(new w.Event('input', { bubbles: true }));
await new Promise(r => setTimeout(r, 300));
check('a year change keeps the county element', w.document.contains(held));
check('a year change keeps focus', w.document.activeElement === held, label(w.document.activeElement));
check('a year change leaves one tooltip open', tooltips() === 1, `${tooltips()} open`);
held.blur();

const enterOn = counties()[0];
enterOn.focus();
enterOn.dispatchEvent(new w.KeyboardEvent('keydown', { key: 'Enter', bubbles: true }));
await new Promise(r => setTimeout(r, 100));
check('Enter opens a county page', w.location.pathname.startsWith('/county/'), w.location.pathname);

w.close();
console.log(failed ? `\n${failed} check(s) failed` : '\nAll checks passed');
process.exit(failed ? 1 : 0);
