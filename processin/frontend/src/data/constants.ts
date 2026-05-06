export const causeLabels: Record<string, string> = {
  Total_Deaths: 'Total Deaths',
  Diseases_of_Heart: 'Diseases of Heart',
  Malignant_Neoplasms: 'Malignant Neoplasms (Cancer)',
  Accidents: 'Accidents (Unintentional Injuries)',
  COVID_19: 'COVID-19',
  Cerebrovascular_Diseases: 'Cerebrovascular Diseases',
  Chronic_Lower_Respiratory_Diseases: 'Chronic Lower Respiratory Diseases',
  Alzheimers_Disease: "Alzheimer's Disease",
  Diabetes_Mellitus: 'Diabetes Mellitus',
  Nephritis_Nephrotic_Syndrome_Nephrosis: 'Nephritis & Nephrotic Syndrome',
  Influenza_and_Pneumonia: 'Influenza & Pneumonia',
  Septicemia: 'Septicemia',
  Intentional_Self_Harm: 'Intentional Self-Harm (Suicide)',
  Chronic_Liver_Disease_Cirrhosis: 'Chronic Liver Disease & Cirrhosis',
  All_Other_Causes: 'All Other Causes',
};

export const causes = Object.keys(causeLabels);

export const EXCLUDED_COUNTIES = ['ILLINOIS', 'Chicago', 'Suburban Cook'];

export const countyCodeToName: Record<string, string> = {
  '001': 'Adams', '003': 'Alexander', '005': 'Bond', '007': 'Boone',
  '009': 'Brown', '011': 'Bureau', '013': 'Calhoun', '015': 'Carroll',
  '017': 'Cass', '019': 'Champaign', '021': 'Christian', '023': 'Clark',
  '025': 'Clay', '027': 'Clinton', '029': 'Coles', '031': 'Cook',
  '033': 'Crawford', '035': 'Cumberland', '037': 'DeKalb', '039': 'DeWitt',
  '041': 'Douglas', '043': 'DuPage', '045': 'Edgar', '047': 'Edwards',
  '049': 'Effingham', '051': 'Fayette', '053': 'Ford', '055': 'Franklin',
  '057': 'Fulton', '059': 'Gallatin', '061': 'Greene', '063': 'Grundy',
  '065': 'Hamilton', '067': 'Hancock', '069': 'Hardin', '071': 'Henderson',
  '073': 'Henry', '075': 'Iroquois', '077': 'Jackson', '079': 'Jasper',
  '081': 'Jefferson', '083': 'Jersey', '085': 'Jo Daviess', '087': 'Johnson',
  '089': 'Kane', '091': 'Kankakee', '093': 'Kendall', '095': 'Knox',
  '097': 'Lake', '099': 'LaSalle', '101': 'Lawrence', '103': 'Lee',
  '105': 'Livingston', '107': 'Logan', '109': 'McDonough', '111': 'McHenry',
  '113': 'McLean', '115': 'Macon', '117': 'Macoupin', '119': 'Madison',
  '121': 'Marion', '123': 'Marshall', '125': 'Mason', '127': 'Massac',
  '129': 'Menard', '131': 'Mercer', '133': 'Monroe', '135': 'Montgomery',
  '137': 'Morgan', '139': 'Moultrie', '141': 'Ogle', '143': 'Peoria',
  '145': 'Perry', '147': 'Piatt', '149': 'Pike', '151': 'Pope',
  '153': 'Pulaski', '155': 'Putnam', '157': 'Randolph', '159': 'Richland',
  '161': 'Rock Island', '163': 'St. Clair', '165': 'Saline', '167': 'Sangamon',
  '169': 'Schuyler', '171': 'Scott', '173': 'Shelby', '175': 'Stark',
  '177': 'Stephenson', '179': 'Tazewell', '181': 'Union', '183': 'Vermilion',
  '185': 'Wabash', '187': 'Warren', '189': 'Washington', '191': 'Wayne',
  '193': 'White', '195': 'Whiteside', '197': 'Will', '199': 'Williamson',
  '201': 'Winnebago', '203': 'Woodford',
};

export const IDPH_DISTRICTS: Record<number, { name: string; counties: string[] }> = {
  1: { name: 'District 1 — Metro Chicago', counties: ['Lake','McHenry','Cook','Kane','DuPage','Will'] },
  2: { name: 'District 2 — Northwest', counties: ['Jo Daviess','Stephenson','Winnebago','Boone','Ogle','Carroll','Whiteside','Lee','Rock Island','Henry'] },
  3: { name: 'District 3 — North Central', counties: ['DeKalb','Kendall','LaSalle','Bureau','Grundy','Kankakee','Livingston','Iroquois','Ford'] },
  4: { name: 'District 4 — West Central', counties: ['Mercer','Putnam','Stark','Knox','Marshall','Henderson','Warren','Peoria','Woodford','Tazewell','Fulton','McDonough'] },
  5: { name: 'District 5 — Central', counties: ['McLean','Vermilion','Champaign','Piatt','DeWitt','Edgar','Douglas'] },
  6: { name: 'District 6 — West', counties: ['Hancock','Mason','Logan','Schuyler','Adams','Menard','Cass','Brown','Sangamon','Morgan','Pike','Christian','Scott','Montgomery','Macoupin'] },
  7: { name: 'District 7 — East Central', counties: ['Macon','Moultrie','Coles','Shelby','Clark','Cumberland','Effingham','Fayette','Crawford','Jasper','Clay','Lawrence','Richland','Wayne','Wabash','Edwards'] },
  8: { name: 'District 8 — Southwest', counties: ['Greene','Calhoun','Jersey','Bond','Madison','Marion','Clinton','St. Clair','Washington','Monroe','Randolph'] },
  9: { name: 'District 9 — Southeast', counties: ['Jefferson','White','Hamilton','Perry','Franklin','Jackson','Gallatin','Saline','Williamson','Hardin','Pope','Johnson','Union','Massac','Pulaski','Alexander'] },
};

// Empty string = same-origin requests (API served by the same host as the SPA)
export const API_BASE = import.meta.env.VITE_API_BASE ?? '';

export const providerMetricLabels: Record<string, string> = {
  total_active_mds_per_100k: 'Total Active MDs /100k',
  primary_care_physicians_per_100k: 'Primary Care Physicians /100k',
  hospital_beds_per_100k: 'Hospital Beds /100k',
  hpsa_primary_care_designation: 'HPSA Designation',
  psychiatry_mds_per_100k: 'Psychiatry MDs /100k',
};

export const providerMetrics = Object.keys(providerMetricLabels);

export const providerMetricShort: Record<string, string> = {
  total_active_mds_per_100k: 'Total MDs',
  primary_care_physicians_per_100k: 'PCP',
  hospital_beds_per_100k: 'Beds',
  hpsa_primary_care_designation: 'HPSA',
  psychiatry_mds_per_100k: 'Psychiatry',
};

// Higher value = better access for all metrics except HPSA (where higher = worse)
export const providerMetricInverted: Record<string, boolean> = {
  total_active_mds_per_100k: false,
  primary_care_physicians_per_100k: false,
  hospital_beds_per_100k: false,
  hpsa_primary_care_designation: true,
  psychiatry_mds_per_100k: false,
};

export const MONO: React.CSSProperties = { fontFamily: "'IBM Plex Mono', monospace" };

/** Linear regression slope over a series of [year, rate] points. */
export function calcSlope(data: Record<string, number | string>, yearStart: number, yearEnd: number): number {
  const pts: { x: number; y: number }[] = [];
  for (let y = yearStart; y <= yearEnd; y++) {
    const rate = Number(data[y.toString()]);
    if (rate > 0) pts.push({ x: y, y: rate });
  }
  if (pts.length < 2) return 0;
  const n = pts.length;
  const sx = pts.reduce((s, p) => s + p.x, 0);
  const sy = pts.reduce((s, p) => s + p.y, 0);
  const sxy = pts.reduce((s, p) => s + p.x * p.y, 0);
  const sx2 = pts.reduce((s, p) => s + p.x * p.x, 0);
  return (n * sxy - sx * sy) / (n * sx2 - sx * sx);
}
