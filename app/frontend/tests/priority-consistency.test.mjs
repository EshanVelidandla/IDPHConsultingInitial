/**
 * Issue #12: a legend, a label and a helper must not disagree with the code
 * that classifies the data. Run from app/frontend with:
 *   node --test --experimental-strip-types tests/priority-consistency.test.mjs
 */

import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

import { HIGH_RATIO, QUADRANT_DESC, pearsonR, quadrantOf } from '../src/data/analytics.ts';

const SRC = path.join(path.dirname(fileURLToPath(import.meta.url)), '..', 'src');

function read(rel) {
  return fs.readFileSync(path.join(SRC, rel), 'utf8');
}

function sourceFiles(dir = SRC) {
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap((e) => {
    const p = path.join(dir, e.name);
    if (e.isDirectory()) return sourceFiles(p);
    return /\.tsx?$/.test(e.name) ? [p] : [];
  });
}

test('a county 15% above the state rate is not described as at or below it', () => {
  const key = quadrantOf(1.15, 2);
  assert.equal(key, 'watch');
  assert.match(QUADRANT_DESC[key], new RegExp(`At or below ${HIGH_RATIO}x state`));
  assert.doesNotMatch(QUADRANT_DESC[key], /the state rate/);
});

test('each description names the side of the split its quadrant is on', () => {
  const above = HIGH_RATIO + 0.01;
  assert.equal(quadrantOf(above, 1), 'priority');
  assert.equal(quadrantOf(above, -1), 'recovering');
  assert.equal(quadrantOf(HIGH_RATIO, 1), 'watch');
  assert.equal(quadrantOf(HIGH_RATIO, -1), 'stable');
  assert.equal(quadrantOf(above, null), 'nodata');

  for (const key of ['priority', 'recovering']) {
    assert.ok(QUADRANT_DESC[key].startsWith(`Above ${HIGH_RATIO}x state`), key);
  }
  for (const key of ['watch', 'stable']) {
    assert.ok(QUADRANT_DESC[key].startsWith(`At or below ${HIGH_RATIO}x state`), key);
  }
});

test('Stable does not claim a county is below the state rate', () => {
  // quadrantOf(1.1, -1) is Stable, and so is a flat county.
  assert.equal(quadrantOf(1.1, -1), 'stable');
  assert.equal(quadrantOf(1.1, 0), 'stable');
  assert.doesNotMatch(QUADRANT_DESC.stable, /below the state/i);
  assert.match(QUADRANT_DESC.stable, /flat or improving/);
  assert.match(QUADRANT_DESC.recovering, /flat or improving/);
});

test('pearsonR and TIP_STYLE are defined once, in analytics.ts', () => {
  const offenders = sourceFiles()
    .filter((f) => /function pearsonR|const TIP_STYLE/.test(fs.readFileSync(f, 'utf8')))
    .map((f) => path.relative(SRC, f).split(path.sep).join('/'));
  assert.deepEqual(offenders, ['data/analytics.ts']);
});

test('the shared pearsonR says null rather than 0 when r is undefined', () => {
  assert.equal(pearsonR([1, 2], [1, 2]), null);
  assert.equal(pearsonR([1, 1, 1], [1, 2, 3]), null);
  assert.equal(pearsonR([1, 2, 3], [2, 4, 6]), 1);
});

test('the Access tooltip colours against the real state rate', () => {
  const src = read('components/AccessMortalityView.tsx');
  assert.doesNotMatch(src, /dotColor\(d\.hpsa, d\.y, 0\)/);
  assert.match(src, /<ScatterTip[^>]*stateY=\{stateDeathRate\}/);
});

test('the Priority chart marks the classification split, and its tooltip survives a null slope', () => {
  const src = read('components/PriorityMatrix.tsx');
  assert.match(src, /<ReferenceLine x=\{HIGH_RATIO\}/);
  assert.match(src, /y: number \| null/);
  assert.match(src, /d\.y === null/);
});

test('Map priority caption uses the served trend window and a strict comparison', () => {
  const src = read('components/MapView.tsx');
  assert.ok(!src.includes('2015–{selectedYear}'));
  assert.ok(src.includes('{Math.min(trendFrom, selectedYear)}–{selectedYear} slope is positive'));
  assert.doesNotMatch(src, /≥ 20%/);
});

test('Pulse COVID text claims only what the series shows', () => {
  assert.doesNotMatch(read('components/PulseView.tsx'), /on record/);
});
