import pandas as pd
import os

def process_death_data():
    # Input and output directories
    input_dir = 'csv_output'
    output_dir = '../processin/backend/static/death_rate_tables'
    os.makedirs(output_dir, exist_ok=True)
    
    # List of causes to process
    causes = [
        'Diseases_of_Heart',
        'Malignant_Neoplasms',
        'Accidents',
        'COVID_19',
        'Cerebrovascular_Diseases',
        'Chronic_Lower_Respiratory_Diseases',
        'Alzheimers_Disease',
        'Diabetes_Mellitus',
        'Nephritis_Nephrotic_Syndrome_Nephrosis',
        'Influenza_and_Pneumonia',
        'Total_Deaths'
    ]
    
    # Process each year's data
    all_years_data = {}
    for year in range(2008, 2023):
        file_path = os.path.join(input_dir, f'death_data_{year}.csv')
        if os.path.exists(file_path):
            df = pd.read_csv(file_path)
            # Remove duplicates, keeping the first occurrence
            df = df.drop_duplicates(subset=['County'], keep='first')
            # Convert numeric columns to float, replacing empty strings with NaN
            for col in df.columns:
                if col != 'County':
                    df[col] = pd.to_numeric(df[col], errors='coerce')
            all_years_data[str(year)] = df
    
    # Create cause-specific files
    for cause in causes:
        cause_data = []
        for year, df in all_years_data.items():
            if cause in df.columns:
                year_data = df[['County', cause]].copy()
                year_data = year_data.rename(columns={cause: year})
                cause_data.append(year_data)
        
        if cause_data:
            # Merge all years for this cause
            merged_df = cause_data[0]
            for df in cause_data[1:]:
                merged_df = pd.merge(merged_df, df, on='County', how='outer')
            
            # Fill NaN values with empty string to match expected format
            merged_df = merged_df.fillna('')
            
            # Save to output directory
            output_file = os.path.join(output_dir, f'{cause}_death_rates_by_county_year.csv')
            merged_df.to_csv(output_file, index=False)
            print(f'Processed {cause} data')

if __name__ == '__main__':
    process_death_data() 