/**
 * smoke.mjs must not pass a dead app. Each case runs the script against a stub
 * backend whose /health is fine while its data is not, using the built bundle.
 *
 * Run from app/frontend after npm run build: npm test
 */

import assert from 'node:assert/strict';
import { spawn } from 'node:child_process';
import fs from 'node:fs';
import http from 'node:http';
import path from 'node:path';
import { after, before, test } from 'node:test';
import { fileURLToPath } from 'node:url';

const FRONTEND = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const UI = path.join(FRONTEND, '..', 'backend', 'ui');
const ROUTE_COUNT = 13;
const built = fs.existsSync(path.join(UI, 'index.html'));

let mode = 'empty';
let server;
let origin;

before(async () => {
  server = http.createServer((req, res) => {
    res.setHeader('content-type', 'application/json');
    if (req.url === '/health') return res.end('{"status":"ok"}');
    if (mode === 'error') res.statusCode = 500;
    res.end('[]');
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  origin = `http://127.0.0.1:${server.address().port}`;
});

after(() => server.close());

function smoke(env) {
  return new Promise(resolve => {
    const child = spawn(process.execPath, ['smoke.mjs'], {
      cwd: FRONTEND,
      env: { ...process.env, SMOKE_ORIGIN: origin, SMOKE_SETTLE_MS: '800', SMOKE_FAIL: '', ...env },
    });
    let out = '';
    child.stdout.on('data', d => { out += d; });
    child.stderr.on('data', d => { out += d; });
    child.on('close', status => resolve({ status, out }));
  });
}

function assertEveryRouteFailed({ status, out }) {
  assert.equal(status, 1, out);
  assert.equal(out.match(/^FAIL \//gm)?.length, ROUTE_COUNT, out);
  assert.doesNotMatch(out, /^ok /m, out);
}

test('healthy backend with no data fails every route', { skip: !built && 'run npm run build first' }, async () => {
  mode = 'empty';
  const run = await smoke();
  assertEveryRouteFailed(run);
  assert.match(run.out, /no data:/);
});

test('status 500 on data fails every route', { skip: !built && 'run npm run build first' }, async () => {
  mode = 'error';
  const run = await smoke();
  assertEveryRouteFailed(run);
  assert.match(run.out, /status 500/);
});

test("SMOKE_FAIL='.*' fails every route, reports /admin and does not crash Node", { skip: !built && 'run npm run build first' }, async () => {
  mode = 'empty';
  const run = await smoke({ SMOKE_FAIL: '.*' });
  assertEveryRouteFailed(run);
  assert.match(run.out, /network error/);
  // AdminPanel catches its own failed loads since #11, so no crash is expected.
  assert.match(run.out, /^FAIL \/admin\b/m);
  assert.doesNotMatch(run.out, /^FAIL \/admin\b.*crash/m);
  assert.match(run.out, /^FAIL \/county\/DuPage/m);
});

test('unreachable backend exits 2', { skip: !built && 'run npm run build first' }, async () => {
  const run = await smoke({ SMOKE_ORIGIN: 'http://127.0.0.1:1' });
  assert.equal(run.status, 2, run.out);
});
