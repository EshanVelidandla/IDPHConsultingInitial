/**
 * Logic tests for the pure modules under src/data.
 *
 * Uses Node's own test runner and Vite's module loader, so TypeScript runs
 * without adding a dependency. Run with `npm test` from app/frontend.
 */
import { after, before, test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createServer } from 'vite';

const here = dirname(fileURLToPath(import.meta.url));
const root = resolve(here, '..');
const EXCLUDED = ['ILLINOIS', 'Chicago', 'Suburban Cook'];

let server;
let A;

before(async () => {
  server = await createServer({
    root,
    configFile: false,
    logLevel: 'error',
    appType: 'custom',
    server: { middlewareMode: true, hmr: false, watch: null },
  });
  A = await server.ssrLoadModule('/src/data/analytics.ts');
});

after(async () => {
  await server?.close();
});

/** Read a published table the way the API serves it: blank cells are null. */
function readTable(relative) {
  const text = readFileSync(resolve(root, '../backend/static', relative), 'utf8');
  const [header, ...lines] = text.trim().split(/\r?\n/).map((l) => l.split(','));
  return lines.map((cells) => Object.fromEntries(
    header.map((h, i) => [h, h === 'County' ? cells[i] : cells[i] === '' ? null : Number(cells[i])]),
  ));
}

test('bandOf keeps a real zero apart from a missing value', () => {
  assert.equal(A.bandOf(0, 100), 'low');
  assert.equal(A.bandOf(null, 100), 'nodata');
});

test('toRate keeps zero and returns null for a blank cell', () => {
  const row = { County: 'X', 2021: 0, 2022: null, 2020: '' };
  assert.equal(A.toRate(row, 2021), 0);
  assert.equal(A.toRate(row, 2022), null);
  assert.equal(A.toRate(row, 2020), null);
  assert.equal(A.toRate(row, 2019), null);
});

test('tileColor gives a real zero the low fill and a missing value the no-data fill', () => {
  const low = A.bandStyle('low').fill;
  const nodata = A.bandStyle('nodata').fill;
  assert.equal(A.tileColor(0, 33.5), low);
  assert.equal(A.tileColor(null, 33.5), nodata);
  assert.equal(A.tileColor(0, 0), nodata, 'no state rate means nothing to compare against');
  assert.notEqual(low, nodata);
});

test('rateMapOf separates null from zero, lower-cases keys, and skips excluded rows', () => {
  const rows = [
    { County: 'ILLINOIS', 2022: 40 },
    { County: 'Pulaski', 2022: 0 },
    { County: 'Cass', 2022: null },
  ];
  assert.deepEqual(A.rateMapOf(rows, 2022, EXCLUDED), { pulaski: 0, cass: null });
});

test('ratedCounties keeps zeros, drops nulls, and rateRange can start at zero', () => {
  const rows = [
    { County: 'ILLINOIS', 2022: 40 },
    { County: 'A', 2022: 0 },
    { County: 'B', 2022: null },
    { County: 'C', 2022: 12.5 },
  ];
  assert.deepEqual(A.ratedCounties(rows, 2022, EXCLUDED), [
    { county: 'A', rate: 0 },
    { county: 'C', rate: 12.5 },
  ]);
  assert.deepEqual(A.rateRange(rows, 2022, EXCLUDED), { min: 0, max: 12.5 });
  assert.equal(A.rateRange([{ County: 'B', 2022: null }], 2022, EXCLUDED), null);
});

test("reviewer's repro: Alzheimer's 2022 keeps its two zero counties", () => {
  const rows = readTable('death_rate_tables/Alzheimers_Disease_death_rates_by_county_year.csv');
  const rated = A.ratedCounties(rows, 2022, EXCLUDED);
  assert.equal(rated.length, 102);
  const zeros = rated.filter((d) => d.rate === 0).map((d) => d.county).sort();
  assert.deepEqual(zeros, ['Pulaski', 'Schuyler']);
  assert.equal(A.rateRange(rows, 2022, EXCLUDED).min, 0);

  const state = A.toRate(rows.find((r) => r.County === 'ILLINOIS'), 2022);
  const map = A.rateMapOf(rows, 2022, EXCLUDED);
  assert.equal(A.tileColor(map.pulaski, state), A.bandStyle('low').fill);
  assert.equal(A.tileColor(map.schuyler, state), A.tileColor(map.cass, state));
});

test('a cause IDPH stopped publishing stays null, not zero', () => {
  const rows = readTable('death_rate_tables/Intentional_Self_Harm_death_rates_by_county_year.csv');
  assert.equal(A.ratedCounties(rows, 2022, EXCLUDED).length, 0);
  assert.equal(A.rateRange(rows, 2022, EXCLUDED), null);
  assert.equal(A.tileColor(A.rateMapOf(rows, 2022, EXCLUDED).pope, null), A.bandStyle('nodata').fill);
});

test('zero-provider counties stay in the provider series', () => {
  const rows = readTable('provider_tables/psychiatry_mds_per_100k_by_county_year.csv');
  const rated = A.ratedCounties(rows, 2022, EXCLUDED);
  assert.equal(rated.length, 102);
  assert.equal(rated.filter((d) => d.rate === 0).length, 67);
  assert.equal(A.rateRange(rows, 2022, EXCLUDED).min, 0);
});
