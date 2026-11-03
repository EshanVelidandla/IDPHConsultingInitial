// Fixture for the map test. Pulaski is a real zero, Adams is a missing cell.
const rows = [
  { County: 'ILLINOIS', 2022: 30 },
  { County: 'Pulaski', 2022: 0 },
  { County: 'Adams', 2022: null },
  { County: 'Cass', 2022: 15.8 },
  { County: 'Cook', 2022: 30 },
];
const geo = { type: 'FeatureCollection', features: [] };
export const fetchGeoJson = async () => ({ data: geo });
export const fetchAnnotations = async () => ({ data: [] });
export const fetchDeathRates = async () => ({ data: rows });
export const fetchProviderData = async () => ({ data: [] });
export const useMeta = () => ({ meta: { counties: [], provider_metrics: {}, population_note: '' }, loading: false });
