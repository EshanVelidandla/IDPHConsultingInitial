import assert from 'node:assert/strict';
import fs from 'node:fs';
import { test } from 'node:test';
import { CANONICAL_COUNTY } from '../src/data/constants.ts';

const staticFile = name => new URL(`../../backend/static/${name}`, import.meta.url);

const tableNames = fs
  .readFileSync(staticFile('death_rate_tables/Total_Deaths_death_rates_by_county_year.csv'), 'utf8')
  .split(/\r?\n/)
  .slice(1)
  .filter(Boolean)
  .map(line => line.split(',')[0]);

test('holds every rate table name, spelled as the table spells it', () => {
  assert.equal(CANONICAL_COUNTY.dupage, 'DuPage');
  assert.equal(Object.keys(CANONICAL_COUNTY).length, 105);
  assert.deepEqual(Object.values(CANONICAL_COUNTY).sort(), [...tableNames].sort());
});

test('every GeoJSON county name resolves to a rate table name', () => {
  const geo = JSON.parse(fs.readFileSync(staticFile('illinois-counties.geojson'), 'utf8'));
  const names = geo.features.map(f => f.properties.COUNTY_NAM);
  assert.equal(new Set(names).size, 102);
  for (const name of names) {
    assert.ok(tableNames.includes(CANONICAL_COUNTY[name.toLowerCase()]), name);
  }
});

test('Object.prototype keys are not counties', () => {
  for (const key of ['constructor', 'tostring', '__proto__', 'hasownproperty']) {
    assert.equal(CANONICAL_COUNTY[key], undefined, key);
  }
});
