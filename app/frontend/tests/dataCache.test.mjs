/**
 * Regression tests for the shared data cache in src/data/useDataset.ts.
 *
 * The cache used to be cleared only after an upload, so a dataset delete or an
 * annotation edit left every view serving the old response for the rest of the
 * session. A failed request also evicted its URL unconditionally, so an older
 * failure could remove a newer entry.
 *
 * useDataset.ts uses extensionless imports and constants.ts reads
 * import.meta.env, so plain Node cannot load them. Vite is already a dev
 * dependency, and its SSR loader runs the real module. No request reaches a
 * network: axios is given a stub adapter that the tests answer by hand.
 *
 * Usage: npm test
 */

import { after, before, beforeEach, test } from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import axios from 'axios';
import { createServer } from 'vite';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');

let server;
let cacheDir;
let data;

/** Every request the stub adapter received, oldest first. */
let requests;
/** When true the stub leaves requests pending for the test to answer. */
let manual;
/** When true the stub rejects writes, standing in for a 4xx or 5xx. */
let failWrites;

function stubAdapter(config) {
  return new Promise((resolve, reject) => {
    const n = requests.length + 1;
    const request = {
      method: config.method,
      answer: (body) => resolve({ data: body, status: 200, statusText: 'OK', headers: {}, config }),
      fail: () => reject(new Error(`request ${n} failed`)),
    };
    requests.push(request);
    if (manual) return;
    if (failWrites && config.method !== 'get') request.fail();
    else request.answer([`response ${n}`]);
  });
}

const gets = () => requests.filter((r) => r.method === 'get');

/** axios reaches the adapter a few ticks after the call, so wait for it. */
async function untilRequests(count) {
  for (let i = 0; i < 100 && requests.length < count; i++) {
    await new Promise((r) => setImmediate(r));
  }
  assert.equal(requests.length, count);
}

before(async () => {
  // The Vite cache goes to a temp folder, because node_modules may be shared.
  cacheDir = fs.mkdtempSync(path.join(os.tmpdir(), 'data-cache-test-'));
  server = await createServer({
    root: ROOT,
    configFile: false,
    cacheDir,
    logLevel: 'silent',
    appType: 'custom',
    optimizeDeps: { noDiscovery: true, include: [] },
    server: { middlewareMode: true, hmr: false, ws: false, watch: null },
  });
  data = await server.ssrLoadModule('/src/data/useDataset.ts');
  axios.defaults.adapter = stubAdapter;
});

after(async () => {
  await server.close();
  fs.rmSync(cacheDir, { recursive: true, force: true });
});

beforeEach(() => {
  data.invalidateDataCache();
  requests = [];
  manual = false;
  failWrites = false;
});

test('a repeat read is served from the cache', async () => {
  const first = await data.fetchAnnotations();
  const second = await data.fetchAnnotations();
  assert.equal(gets().length, 1);
  assert.deepEqual(second.data, first.data);
});

for (const [verb, send] of [
  ['DELETE', () => axios.delete('/admin/datasets/liver')],
  ['POST', () => axios.post('/annotations', { county: 'Adams' })],
  ['PUT', () => axios.put('/annotations/1', { county: 'Adams' })],
  ['PATCH', () => axios.patch('/annotations/1', { county: 'Adams' })],
]) {
  test(`a successful ${verb} clears the cache`, async () => {
    const old = await data.fetchDeathRates('liver');
    await send();
    const fresh = await data.fetchDeathRates('liver');
    assert.equal(gets().length, 2);
    assert.notDeepEqual(fresh.data, old.data);
  });
}

test('a failed write keeps the cache', async () => {
  await data.fetchAnnotations();
  failWrites = true;
  await assert.rejects(axios.delete('/annotations/1'));
  await data.fetchAnnotations();
  assert.equal(gets().length, 1);
});

test('an uncached GET does not clear the cache', async () => {
  await data.fetchAnnotations();
  await axios.get('/admin/datasets');
  await data.fetchAnnotations();
  // One for the annotations and one for the datasets list, no second annotations.
  assert.equal(gets().length, 2);
});

test('a read in flight during a write does not outlive it', async () => {
  manual = true;
  const stale = data.fetchAnnotations();
  await untilRequests(1);
  const write = axios.delete('/annotations/1');
  await untilRequests(2);
  requests[1].answer({ deleted: true });
  await write;

  const fresh = data.fetchAnnotations();
  await untilRequests(3);
  requests[2].answer(['after the write']);
  requests[0].answer(['before the write']);
  assert.deepEqual((await stale).data, ['before the write']);
  assert.deepEqual((await fresh).data, ['after the write']);

  const again = data.fetchAnnotations();
  await new Promise((r) => setImmediate(r));
  assert.equal(gets().length, 2);
  assert.deepEqual((await again).data, ['after the write']);
});

test('a stale rejection leaves the newer entry in place', async () => {
  manual = true;
  const stale = data.fetchAnnotations();
  await untilRequests(1);
  data.invalidateDataCache();
  const fresh = data.fetchAnnotations();
  await untilRequests(2);
  requests[1].answer(['newer']);
  await fresh;

  requests[0].fail();
  await assert.rejects(stale);

  // A new request here would never be answered, so check for one before waiting.
  const again = data.fetchAnnotations();
  await new Promise((r) => setImmediate(r));
  assert.equal(gets().length, 2);
  assert.deepEqual((await again).data, ['newer']);
});

test('a failed request evicts its own entry so the view can recover', async () => {
  manual = true;
  const failing = data.fetchAnnotations();
  await untilRequests(1);
  requests[0].fail();
  await assert.rejects(failing);

  const retry = data.fetchAnnotations();
  await untilRequests(2);
  requests[1].answer(['recovered']);
  assert.deepEqual((await retry).data, ['recovered']);
});
