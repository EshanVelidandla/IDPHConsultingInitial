import { API_BASE, causeLabels, EXCLUDED_COUNTIES, providerMetricLabels } from './constants';
import { toRate } from './analytics';

/**
 * What the top strip's Export button will download. Access, Pulse and Providers
 * have their own selections, which Export cannot see, so each registers this
 * while it is mounted. A target holds a server URL or rows built in the client.
 */
export type ExportTarget = { label: string; filename: string } & (
  | { url: string; rows?: undefined }
  | { rows: string[][]; url?: undefined }
);

export type SetExportTarget = (target: ExportTarget | null) => void;

/** Views that show `shared.selectedCause` and so need no registration. */
const SHARED_CAUSE_ROUTES = ['/map', '/insights', '/priority'];

export function causeExportTarget(cause: string): ExportTarget {
  return {
    label: causeLabels[cause] ?? cause,
    url: `${API_BASE}/export/csv?cause=${encodeURIComponent(cause)}`,
    filename: `idph_${cause}_death_rates.csv`,
  };
}

/** The statewide row and the counties the Providers view displays for one year. */
export function providerExportTarget(
  metric: string,
  year: number,
  rows: Array<{ County: string; [year: string]: number | string }>,
): ExportTarget {
  const label = `${providerMetricLabels[metric] ?? metric} ${year}`;
  const shown = rows.filter(d => d.County === 'ILLINOIS' || !EXCLUDED_COUNTIES.includes(d.County));
  return {
    label,
    filename: `idph_${metric}_${year}.csv`,
    // A missing value stays blank, so it cannot be read as a true zero.
    rows: [['County', label], ...shown.map(d => [d.County, String(toRate(d as never, year) ?? '')])],
  };
}

export function toCsv(rows: string[][]): string {
  const cell = (v: string) => (/[",\r\n]/.test(v) ? `"${v.replace(/"/g, '""')}"` : v);
  return rows.map(r => r.map(cell).join(',')).join('\r\n') + '\r\n';
}

/** The target for the current route, or the reason there is none. */
export function resolveExport(
  pathname: string,
  registered: ExportTarget | null,
  selectedCause: string,
): { target: ExportTarget; reason: null } | { target: null; reason: string } {
  if (registered) return { target: registered, reason: null };
  if (!SHARED_CAUSE_ROUTES.includes(pathname)) return { target: null, reason: 'Nothing to export on this view.' };
  if (!selectedCause) return { target: null, reason: 'Select a cause to export.' };
  return { target: causeExportTarget(selectedCause), reason: null };
}
