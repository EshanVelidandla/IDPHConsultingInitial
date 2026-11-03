// #29: a county's fill and border must describe the same reading. Renders the
// real MapView in jsdom with the map and the API stubbed, then reads the style
// it would give each county.
import test from 'node:test';
import assert from 'node:assert/strict';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { JSDOM } from 'jsdom';
import { createServer } from 'vite';

const here = path.dirname(fileURLToPath(import.meta.url));
const stub = (name) => path.join(here, 'stubs', name);

test('fill and border agree for real zeros and missing cells', async (t) => {
  const dom = new JSDOM('<div id="root"></div>', { pretendToBeVisual: true });
  for (const k of ['window', 'document', 'HTMLElement', 'SVGElement', 'Element', 'Node', 'requestAnimationFrame', 'cancelAnimationFrame']) {
    globalThis[k] = k === 'window' ? dom.window : dom.window[k];
  }
  Object.defineProperty(globalThis, 'navigator', { value: dom.window.navigator, configurable: true });

  // cacheDir stays out of node_modules, which may be a shared install.
  const server = await createServer({
    configFile: false,
    root: path.resolve(here, '..'),
    cacheDir: path.join(os.tmpdir(), 'idph-map-band-test'),
    logLevel: 'error',
    appType: 'custom',
    server: { middlewareMode: true, ws: false, watch: null },
    optimizeDeps: { noDiscovery: true, include: [] },
    resolve: {
      alias: [
        { find: 'react-leaflet', replacement: stub('react-leaflet.mjs') },
        { find: 'react-router-dom', replacement: stub('react-router-dom.mjs') },
        { find: /^.*\/data\/useDataset$/, replacement: stub('useDataset.mjs') },
      ],
    },
  });
  t.after(() => server.close());

  const { default: MapView } = await server.ssrLoadModule('/src/components/MapView.tsx');
  const { bandStyle } = await server.ssrLoadModule('/src/data/analytics.ts');
  const { createElement } = await import('react');
  const { createRoot } = await import('react-dom/client');

  const shared = { selectedCause: 'Alzheimers', selectedYear: 2022, selectedDistrict: '', searchTarget: '', dataYearRange: { min: 2022, max: 2022 } };
  const root = createRoot(dom.window.document.getElementById('root'));
  root.render(createElement(MapView, { shared, setShared() {} }));
  t.after(() => root.unmount());

  const style = (name) => (globalThis.__mapStyle ?? (() => ({})))({ properties: { COUNTY_NAM: name } });
  const low = bandStyle('low');
  const noData = bandStyle('nodata');
  for (let i = 0; i < 100 && style('Cass').fillColor !== low.fill; i++) {
    await new Promise((r) => setTimeout(r, 20));
  }

  const paint = (name) => { const s = style(name); return [s.fillColor, s.color]; };
  assert.deepEqual(paint('Cass'), [low.fill, low.border], 'low rate');
  assert.deepEqual(paint('Pulaski'), [low.fill, low.border], 'real zero reads as below state');
  assert.deepEqual(paint('Adams'), [noData.fill, noData.line], 'null cell reads as no data');
  assert.deepEqual(paint('Nowhere'), [noData.fill, noData.line], 'county absent from the table reads as no data');
  assert.deepEqual(paint('Cook'), [bandStyle('near').fill, bandStyle('near').border], 'near state');
});
