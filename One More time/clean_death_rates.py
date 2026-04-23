import pandas as pd
import os
import numpy as np

def clean_county_name(name):
    # Remove extra spaces and fix known issues
    name = name.strip()
    if name == 'Alexande r':
        return 'Alexander'
    if name == 'Suburban Coo k':
        return 'Suburban Cook'
    if name == 'Grund y':
        return 'Grundy'
    return name

def is_valid_county(name):
    # List of valid entries (102 counties + Chicago + Suburban Cook)
    invalid_entries = [
        'DeathsCause of DeathFayette',
        'East Side HD',
        'Evanston',
        'Oak Park',
        'Skokie',
        'Stickney Township',
        'Remainder of county',
        'Champaign-Urbana',
        ''  # Empty strings
    ]
    return name not in invalid_entries

def calculate_illinois_average(df):
    # Get all numeric columns (years)
    year_columns = [col for col in df.columns if col != 'County']
    
    # Calculate the weighted average for each year
    # Cook County (including Chicago and Suburban Cook) has about 40% of Illinois population
    # So we'll weight Cook County data more heavily
    illinois_data = {}
    for year in year_columns:
        # Get Cook County region data (including Chicago)
        cook_data = df[df['County'].isin(['Cook', 'Chicago', 'Suburban Cook'])][year].mean()
        # Get rest of state data
        rest_data = df[~df['County'].isin(['Cook', 'Chicago', 'Suburban Cook'])][year].mean()
        # Calculate weighted average (40% Cook, 60% rest of state)
        illinois_data[year] = cook_data * 0.4 + rest_data * 0.6
    
    # Create Illinois row
    illinois_row = pd.DataFrame([{'County': 'ILLINOIS', **illinois_data}])
    return illinois_row

def clean_death_rate_file(input_file):
    # Read the CSV file
    df = pd.read_csv(input_file)
    
    # Clean county names
    df['County'] = df['County'].apply(clean_county_name)
    
    # Remove invalid entries
    df = df[df['County'].apply(is_valid_county)]
    
    # Remove duplicate entries
    df = df.drop_duplicates(subset=['County'], keep='first')
    
    # Replace empty strings and invalid values with 0
    for col in df.columns:
        if col != 'County':
            df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)
    
    # Calculate and add Illinois average
    illinois_row = calculate_illinois_average(df)
    
    # Remove any existing ILLINOIS row
    df = df[df['County'] != 'ILLINOIS']
    
    # Add the new ILLINOIS row at the top
    df = pd.concat([illinois_row, df], ignore_index=True)
    
    # Sort by county name, but keep ILLINOIS at the top
    df = pd.concat([
        df[df['County'] == 'ILLINOIS'],
        df[df['County'] != 'ILLINOIS'].sort_values('County')
    ]).reset_index(drop=True)
    
    # Save the cleaned data back to the file
    df.to_csv(input_file, index=False)
    print(f"Cleaned {input_file}")

def main():
    # Get the current script directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    # Go up one level to the Research Work directory
    workspace_dir = os.path.dirname(script_dir)
    # Path to death rate tables
    death_rates_dir = os.path.join(workspace_dir, 'processin', 'backend', 'static', 'death_rate_tables')
    
    print(f"Processing files in: {death_rates_dir}")
    
    # Process all CSV files in the directory
    for filename in os.listdir(death_rates_dir):
        if filename.endswith('_death_rates_by_county_year.csv'):
            file_path = os.path.join(death_rates_dir, filename)
            clean_death_rate_file(file_path)

if __name__ == '__main__':
    main() 