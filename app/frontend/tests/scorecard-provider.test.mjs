/**
 * Regression test for the Scorecard provider request loop (#21).
 *
 * When every /provider_data request failed, the effect stored a new empty
 * object, which was one of its own dependencies, so it ran again. Failures are
 * evicted from the cache, so each round reached the network: NCSA measured 200
 * failed requests in 572 ms.
 *
 * This renders the real component in jsdom, loaded through Vite so the TSX
 * compiles, and answers requests from a stub axios adapter that counts them.
 * The stub stops failing after CIRCUIT_BREAKER calls so that a regression fails
 * the assertion on the count instead of spinning until the test times out.
 *
 * Run from app/frontend: node --test tests/scorecard-provider.test.mjs
 */

import { after, afterEach, before, beforeEach, test } from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { JSDOM } from 'jsdom';
import { createServer } from 'vite';

const FRONTEND = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const SETTLE_MS = 300;
const MAX_REQUESTS_PER_TOGGLE = 5;
const CIRCUIT_BREAKER = 300;
const YEAR = 2020;

// React and its DOM renderer read these globals when they load.
const dom = new JSDOM('<!doctype html><div id="root"></div>', { url: 'http://localhost/scorecard', pretendToBeVisual: true });
globalThis.window = dom.window;
globalThis.document = dom.window.document;
Object.defineProperty(globalThis, 'navigator', { value: dom.window.navigator, configurable: true });
globalThis.HTMLElement = dom.window.HTMLElement;

let vite, cacheDir, React, createRoot, MemoryRouter, axios, CountyScorecard, invalidateDataCache;
let root, providerRequests, failMetric;

const sleep = ms => new Promise(r => setTimeout(r, ms));

function respond(config, data) {
  return { data, status: 200, statusText: 'OK', headers: {}, config, request: {} };
}

function stubAdapter(config) {
  const url = new URL(config.url, 'http://localhost');
  if (url.pathname === '/provider_data') {
    const metric = url.searchParams.get('metric');
    providerRequests.push(metric);
    if (failMetric(metric) && providerRequests.length <= CIRCUIT_BREAKER) {
      const err = new Error('Request failed with status code 502');
      err.config = config;
      return Promise.reject(err);
    }
    return Promise.resolve(respond(config, [
      { County: 'ILLINOIS', [YEAR]: 80 },
      { County: 'Adams', [YEAR]: 1 },
    ]));
  }
  return Promise.resolve(respond(config, [
    { County: 'ILLINOIS', [YEAR]: 100 },
    { County: 'Adams', [YEAR]: 120 },
  ]));
}

function findToggle() {
  return [...document.querySelectorAll('button')].find(b => /access columns/.test(b.textContent));
}

async function waitFor(predicate, label) {
  for (let i = 0; i < 200; i++) {
    if (predicate()) return;
    await sleep(10);
  }
  assert.fail(`Timed out waiting for ${label}. Page text: ${document.body.textContent.slice(0, 200)}`);
}

async function mountScorecard() {
  const shared = { selectedCause: 'Total_Deaths', selectedYear: YEAR, selectedDistrict: '', searchTarget: '', dataYearRange: { min: 2008, max: 2022 } };
  root = createRoot(document.getElementById('root'));
  root.render(React.createElement(MemoryRouter, null,
    React.createElement(CountyScorecard, { shared, setShared: () => {} })));
  await waitFor(() => findToggle(), 'the Scorecard to render');
}

/** Click the toggle, let any loop run, and return the requests that click caused. */
async function toggle() {
  const start = providerRequests.length;
  findToggle().click();
  await sleep(SETTLE_MS);
  return providerRequests.slice(start);
}

before(async () => {
  cacheDir = fs.mkdtempSync(path.join(os.tmpdir(), 'scorecard-test-'));
  vite = await createServer({
    root: FRONTEND,
    configFile: false,
    // node_modules can be shared between checkouts, so keep Vite's cache out of it.
    cacheDir,
    logLevel: 'error',
    appType: 'custom',
    server: { middlewareMode: true, hmr: false, ws: false },
    optimizeDeps: { noDiscovery: true, include: [] },
  });
  React = (await import('react')).default;
  ({ createRoot } = await import('react-dom/client'));
  ({ MemoryRouter } = await import('react-router-dom'));
  axios = (await import('axios')).default;
  ({ invalidateDataCache } = await vite.ssrLoadModule('/src/data/useDataset.ts'));
  CountyScorecard = (await vite.ssrLoadModule('/src/components/CountyScorecard.tsx')).default;
  axios.defaults.adapter = stubAdapter;
});

beforeEach(() => {
  invalidateDataCache();
  providerRequests = [];
  failMetric = () => false;
});

// Runs on failure too, so one failing test cannot leak its root into the next.
afterEach(async () => {
  root?.unmount();
  root = null;
  document.getElementById('root').innerHTML = '';
  await sleep(0);
});

after(async () => {
  await vite.close();
  fs.rmSync(cacheDir, { recursive: true, force: true });
  dom.window.close();
});

test('all provider requests failing does not loop, and the page stays usable', async () => {
  failMetric = () => true;
  await mountScorecard();

  const first = await toggle();
  assert.ok(first.length <= MAX_REQUESTS_PER_TOGGLE, `${first.length} requests after one toggle`);
  assert.equal(first.length, 3);

  // The requests must also have stopped, not merely be slow to start.
  await sleep(SETTLE_MS);
  assert.equal(providerRequests.length, first.length);

  // A provider failure must not replace the page, or the toggle that retries
  // and the mortality table that did load both vanish.
  assert.ok(findToggle(), 'toggle still on the page');
  assert.ok(document.querySelector('table'), 'table still on the page');
  assert.match(document.body.textContent, /Could not load provider data/);

  // Hiding the columns clears the message and sends nothing.
  assert.equal((await toggle()).length, 0);
  assert.doesNotMatch(document.body.textContent, /Could not load provider data/);

  // Showing them again retries, once.
  const retry = await toggle();
  assert.ok(retry.length > 0, 'toggling back on retries');
  assert.ok(retry.length <= MAX_REQUESTS_PER_TOGGLE, `${retry.length} requests on retry`);
});

test('a retry that succeeds shows the data and clears the message', async () => {
  failMetric = () => true;
  await mountScorecard();
  await toggle();
  await toggle();

  failMetric = () => false;
  assert.equal((await toggle()).length, 3);
  assert.doesNotMatch(document.body.textContent, /Could not load provider data/);
  assert.match(document.querySelector('tbody').textContent, /1\.0/);
});

test('a partial failure keeps what loaded, names what did not, and does not loop', async () => {
  failMetric = m => m === 'hospital_beds_per_100k';
  await mountScorecard();

  assert.equal((await toggle()).length, 3);
  await sleep(SETTLE_MS);
  assert.equal(providerRequests.length, 3);
  assert.match(document.body.textContent, /Could not load provider data/);
  assert.match(document.querySelector('tbody').textContent, /1\.0/);

  // Metrics that loaded are cached, so the retry asks only for the failed one.
  await toggle();
  assert.deepEqual(await toggle(), ['hospital_beds_per_100k']);
});

test('a healthy load is requested once and survives toggling', async () => {
  await mountScorecard();
  assert.equal((await toggle()).length, 3);
  assert.equal((await toggle()).length, 0);
  assert.equal((await toggle()).length, 0);
  assert.doesNotMatch(document.body.textContent, /Could not load provider data/);
});

test('toggling off and on during a load does not send a second round', async () => {
  failMetric = () => true;
  await mountScorecard();
  findToggle().click();
  findToggle().click();
  findToggle().click();
  await sleep(SETTLE_MS);
  assert.ok(providerRequests.length <= MAX_REQUESTS_PER_TOGGLE, `${providerRequests.length} requests`);
});
