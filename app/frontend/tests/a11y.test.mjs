// Accessibility regressions for #14: ink contrast, one source for the caption
// gray, the no-data map cue, and FieldRow's label association. Run: npm test.
import test, { after, before } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync, readdirSync, statSync } from 'node:fs';
import { dirname, join, relative } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createElement as h } from 'react';
import { renderToStaticMarkup } from 'react-dom/server';
import { createServer } from 'vite';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const SRC = join(ROOT, 'src');

function sources(dir = SRC) {
  return readdirSync(dir).flatMap((name) => {
    const path = join(dir, name);
    if (statSync(path).isDirectory()) return sources(path);
    return /\.(tsx?|css)$/.test(name) ? [path] : [];
  });
}

function luminance(hex) {
  const [r, g, b] = [1, 3, 5].map((i) => {
    const c = parseInt(hex.slice(i, i + 2), 16) / 255;
    return c <= 0.03928 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4;
  });
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

function contrast(a, b) {
  const [hi, lo] = [luminance(a), luminance(b)].sort((x, y) => y - x);
  return (hi + 0.05) / (lo + 0.05);
}

const css = readFileSync(join(SRC, 'index.css'), 'utf8');
const token = (name) => {
  const m = css.match(new RegExp(`--${name}:[ ]*(#[0-9A-Fa-f]{6})`));
  assert.ok(m, `token --${name} not found`);
  return m[1];
};

let vite;
before(async () => {
  vite = await createServer({
    root: ROOT,
    configFile: join(ROOT, 'vite.config.ts'),
    appType: 'custom',
    logLevel: 'silent',
    server: { middlewareMode: true, hmr: false, ws: false, watch: null },
  });
});
after(() => vite?.close());

test('every text ink reaches 4.5:1 on paper, paper-2 and card', () => {
  for (const ink of ['ink', 'ink-2', 'ink-3', 'ink-4']) {
    for (const bg of ['paper', 'paper-2', 'card']) {
      const ratio = contrast(token(ink), token(bg));
      assert.ok(ratio >= 4.5, `--${ink} on --${bg} is ${ratio.toFixed(2)}`);
    }
  }
});

test('ink-5 stays above the 3:1 non-text minimum', () => {
  for (const bg of ['paper', 'paper-2', 'card']) {
    const ratio = contrast(token('ink-5'), token(bg));
    assert.ok(ratio >= 3, `--ink-5 on --${bg} is ${ratio.toFixed(2)}`);
  }
});

test('ink-5 is used only by the breadcrumb separator', () => {
  const uses = sources().flatMap((path) =>
    readFileSync(path, 'utf8').split(/\r?\n/)
      .filter((line) => line.includes('var(--ink-5)'))
      .map((line) => `${relative(SRC, path)}: ${line.trim()}`));
  assert.deepEqual(uses, ['index.css: .topstrip .crumb .sep { color: var(--ink-5); font-family: var(--mono); }']);
});

test('the failing grays are gone from source', () => {
  for (const path of sources()) {
    const text = readFileSync(path, 'utf8');
    for (const old of ['#757168', '#C0BCB4']) {
      assert.ok(!text.includes(old), `${relative(SRC, path)} still has ${old}`);
    }
    const hits = (text.match(/#9A968C/g) ?? []).length;
    const allowed = relative(SRC, path) === 'index.css' ? 1 : 0; // the history note above --ink-4
    assert.ok(hits <= allowed, `${relative(SRC, path)} still has #9A968C`);
    if (!path.endsWith(join('data', 'analytics.ts'))) {
      assert.ok(!/const INK_4\s*=/.test(text), `${relative(SRC, path)} declares its own INK_4`);
    }
  }
});

test('analytics INK_4 is the same color as --ink-4', async () => {
  const A = await vite.ssrLoadModule('/src/data/analytics.ts');
  assert.equal(A.INK_4, token('ink-4'));
});

test('no-data has a dashed outline visible against its own fill', async () => {
  const A = await vite.ssrLoadModule('/src/data/analytics.ts');
  const nodata = A.bandStyle('nodata');
  const high = A.bandStyle('high');
  assert.ok(nodata.dash, 'no-data has no dash');
  assert.notEqual(nodata.dash, high.dash);
  assert.equal(A.bandStyle('near').dash, undefined);
  assert.ok(nodata.dash.split(' ')[0] >= 2, 'a 1px dash with round caps renders as dots');
  const ratio = contrast(nodata.line, nodata.fill);
  assert.ok(ratio >= 3, `no-data line on its fill is ${ratio.toFixed(2)}`);
});

test('FieldRow labels the first form control in a multi-child row', async () => {
  const { FieldRow } = await vite.ssrLoadModule('/src/pages/AdminPanel.tsx');

  const html = renderToStaticMarkup(
    h(FieldRow, { label: 'CSV File' }, h('input', { type: 'file' }), h('span', { className: 'tiny' }, 'hint')));
  const target = html.match(/<label[^>]*for="([^"]+)"/)?.[1];
  assert.ok(target, html);
  assert.match(html, new RegExp(`<input[^>]*id="${target}"`));
  assert.ok(!/<span[^>]*id=/.test(html), html);

  const single = renderToStaticMarkup(h(FieldRow, { label: 'Cause' }, h('select')));
  assert.equal(single.match(/for="([^"]+)"/)?.[1], single.match(/<select id="([^"]+)"/)?.[1]);
});

test('FieldRow leaves no dangling htmlFor on a radio group', async () => {
  const { FieldRow } = await vite.ssrLoadModule('/src/pages/AdminPanel.tsx');

  const html = renderToStaticMarkup(
    h(FieldRow, { label: 'Visibility' },
      h('div', null, h('label', null, h('input', { type: 'radio' }), ' Public'))));
  assert.ok(!html.includes(' for='), html);
  const name = html.match(/aria-labelledby="([^"]+)"/)?.[1];
  assert.ok(name, html);
  assert.match(html, new RegExp(`id="${name}"[^>]*>Visibility<`));
});
