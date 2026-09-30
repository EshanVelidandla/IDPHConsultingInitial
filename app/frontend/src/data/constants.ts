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

/**
 * HPSA designation is a category (0 none, 1 whole county, 2 part of county),
 * so it cannot go on a correlation axis or a ranked list. Views that do
 * regression or ranking use this list; views that just colour by designated
 * or not may still read the HPSA table.
 */
export const HPSA_METRIC = 'hpsa_primary_care_designation';
export const continuousProviderMetrics = providerMetrics.filter(m => m !== HPSA_METRIC);

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


/** Linear regression slope over a series of [year, rate] points. */
