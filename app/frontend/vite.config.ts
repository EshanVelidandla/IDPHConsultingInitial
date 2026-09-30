import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  build: {
    // Build straight into the directory the backend serves. Copying dist/ over
    // a running server leaves a half-written assets/ on Windows, which shows up
    // as a styled but blank page because the CSS lands and the JS does not.
    outDir: '../backend/ui',
    emptyOutDir: true,
  },
  server: {
    // The SPA talks to the API directly in development, so set
    // VITE_API_BASE=http://127.0.0.1:8000. The backend already allows
    // localhost:5173 through CORS. There is no /api prefix anywhere in the
    // client, so the old proxy block here was dead configuration.
    port: 5173,
  },
  assetsInclude: ['**/*.png'],
  resolve: {
    alias: {
      '@': '/src'
    }
  }
}); 