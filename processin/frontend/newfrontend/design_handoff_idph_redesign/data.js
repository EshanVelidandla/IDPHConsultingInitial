/* Static data for IDPH prototype — empty values; structure mirrors backend */

window.IDPH_DATA = (function () {
  const causes = [
    { id: 'Total_Deaths', label: 'All-Cause Mortality', short: 'Total' },
    { id: 'Diseases_of_Heart', label: 'Diseases of Heart', short: 'Heart' },
    { id: 'Malignant_Neoplasms', label: 'Malignant Neoplasms (Cancer)', short: 'Cancer' },
    { id: 'Accidents', label: 'Accidents (Unintentional)', short: 'Accidents' },
    { id: 'COVID_19', label: 'COVID-19', short: 'COVID' },
    { id: 'Cerebrovascular_Diseases', label: 'Cerebrovascular Diseases', short: 'Stroke' },
    { id: 'Chronic_Lower_Respiratory_Diseases', label: 'Chronic Lower Respiratory', short: 'CLRD' },
    { id: 'Alzheimers_Disease', label: "Alzheimer's Disease", short: "Alzheimer's" },
    { id: 'Diabetes_Mellitus', label: 'Diabetes Mellitus', short: 'Diabetes' },
    { id: 'Influenza_and_Pneumonia', label: 'Influenza & Pneumonia', short: 'Flu/Pneum' },
    { id: 'Septicemia', label: 'Septicemia', short: 'Septicemia' },
    { id: 'Intentional_Self_Harm', label: 'Intentional Self-Harm', short: 'Suicide' },
    { id: 'Chronic_Liver_Disease_Cirrhosis', label: 'Chronic Liver Disease', short: 'Liver' },
    { id: 'Nephritis_Nephrotic_Syndrome_Nephrosis', label: 'Nephritis & Nephrosis', short: 'Nephritis' },
    { id: 'All_Other_Causes', label: 'All Other Causes', short: 'Other' },
  ];

  const counties = [
    'Adams','Alexander','Bond','Boone','Brown','Bureau','Calhoun','Carroll','Cass','Champaign',
    'Christian','Clark','Clay','Clinton','Coles','Cook','Crawford','Cumberland','DeKalb','DeWitt',
    'Douglas','DuPage','Edgar','Edwards','Effingham','Fayette','Ford','Franklin','Fulton','Gallatin',
    'Greene','Grundy','Hamilton','Hancock','Hardin','Henderson','Henry','Iroquois','Jackson','Jasper',
    'Jefferson','Jersey','Jo Daviess','Johnson','Kane','Kankakee','Kendall','Knox','Lake','LaSalle',
    'Lawrence','Lee','Livingston','Logan','McDonough','McHenry','McLean','Macon','Macoupin','Madison',
    'Marion','Marshall','Mason','Massac','Menard','Mercer','Monroe','Montgomery','Morgan','Moultrie',
    'Ogle','Peoria','Perry','Piatt','Pike','Pope','Pulaski','Putnam','Randolph','Richland',
    'Rock Island','St. Clair','Saline','Sangamon','Schuyler','Scott','Shelby','Stark','Stephenson','Tazewell',
    'Union','Vermilion','Wabash','Warren','Washington','Wayne','White','Whiteside','Will','Williamson',
    'Winnebago','Woodford'
  ];

  const districts = [
    { n: 1, name: 'Metro Chicago', counties: ['Lake','McHenry','Cook','Kane','DuPage','Will'] },
    { n: 2, name: 'Northwest', counties: ['Jo Daviess','Stephenson','Winnebago','Boone','Ogle','Carroll','Whiteside','Lee','Rock Island','Henry'] },
    { n: 3, name: 'North Central', counties: ['DeKalb','Kendall','LaSalle','Bureau','Grundy','Kankakee','Livingston','Iroquois','Ford'] },
    { n: 4, name: 'West Central', counties: ['Mercer','Putnam','Stark','Knox','Marshall','Henderson','Warren','Peoria','Woodford','Tazewell','Fulton','McDonough'] },
    { n: 5, name: 'Central', counties: ['McLean','Vermilion','Champaign','Piatt','DeWitt','Edgar','Douglas'] },
    { n: 6, name: 'West', counties: ['Hancock','Mason','Logan','Schuyler','Adams','Menard','Cass','Brown','Sangamon','Morgan','Pike','Christian','Scott','Montgomery','Macoupin'] },
    { n: 7, name: 'East Central', counties: ['Macon','Moultrie','Coles','Shelby','Clark','Cumberland','Effingham','Fayette','Crawford','Jasper','Clay','Lawrence','Richland','Wayne','Wabash','Edwards'] },
    { n: 8, name: 'Southwest', counties: ['Greene','Calhoun','Jersey','Bond','Madison','Marion','Clinton','St. Clair','Washington','Monroe','Randolph'] },
    { n: 9, name: 'Southeast', counties: ['Jefferson','White','Hamilton','Perry','Franklin','Jackson','Gallatin','Saline','Williamson','Hardin','Pope','Johnson','Union','Massac','Pulaski','Alexander'] },
  ];

  const years = [];
  for (let y = 2009; y <= 2022; y++) years.push(y);

  return { causes, counties, districts, years };
})();
