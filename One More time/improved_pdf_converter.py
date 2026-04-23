import PyPDF2
import pandas as pd
import re
import os
from pathlib import Path

def extract_text_from_pdf(pdf_path):
    """Extract text from PDF file"""
    try:
        print(f"Attempting to read PDF: {pdf_path}")
        with open(pdf_path, 'rb') as file:
            pdf_reader = PyPDF2.PdfReader(file)
            text = ""
            for page in pdf_reader.pages:
                text += page.extract_text()
            print(f"Successfully extracted {len(text)} characters from {pdf_path}")
        return text
    except Exception as e:
        print(f"Error reading {pdf_path}: {e}")
        return None

def parse_death_data_improved(text, year):
    """Improved parser for death data from PDF text"""
    print(f"Parsing data for year {year}")
    lines = text.split('\n')
    data = []
    
    # Define the column headers based on the PDF structure
    headers = [
        'County', 'Total_Deaths', 'Diseases_of_Heart', 'Malignant_Neoplasms', 
        'Accidents', 'COVID_19', 'Cerebrovascular_Diseases', 'Chronic_Lower_Respiratory_Diseases',
        'Alzheimers_Disease', 'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
        'Influenza_and_Pneumonia', 'Septicemia', 'Intentional_Self_Harm',
        'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes'
    ]
    
    # Illinois county names
    counties = [
        'Adams', 'Alexander', 'Bond', 'Boone', 'Brown', 'Bureau', 'Calhoun', 'Carroll', 'Cass',
        'Champaign', 'Christian', 'Clark', 'Clay', 'Clinton', 'Coles', 'Cook', 'Chicago', 
        'Suburban Cook', 'Crawford', 'Cumberland', 'DeKalb', 'DeWitt', 'Douglas', 'DuPage',
        'Edgar', 'Edwards', 'Effingham', 'Fayette', 'Ford', 'Franklin', 'Fulton', 'Gallatin',
        'Greene', 'Grundy', 'Hamilton', 'Hancock', 'Hardin', 'Henderson', 'Henry', 'Iroquois',
        'Jackson', 'Jasper', 'Jefferson', 'Jersey', 'Jo Daviess', 'Johnson', 'Kane', 'Kankakee',
        'Kendall', 'Knox', 'Lake', 'LaSalle', 'Lawrence', 'Lee', 'Livingston', 'Logan', 'Macon',
        'Macoupin', 'Madison', 'Marion', 'Marshall', 'Mason', 'Massac', 'McDonough', 'McHenry',
        'McLean', 'Menard', 'Mercer', 'Monroe', 'Montgomery', 'Morgan', 'Moultrie', 'Ogle',
        'Peoria', 'Perry', 'Piatt', 'Pike', 'Pope', 'Pulaski', 'Putnam', 'Randolph', 'Richland',
        'Rock Island', 'Saline', 'Sangamon', 'Schuyler', 'Scott', 'Shelby', 'St. Clair', 'Stark',
        'Stephenson', 'Tazewell', 'Union', 'Vermilion', 'Wabash', 'Warren', 'Washington', 'Wayne',
        'White', 'Whiteside', 'Will', 'Williamson', 'Winnebago', 'Woodford', 'ILLINOIS'
    ]
    
    # Process each line
    for line in lines:
        line = line.strip()
        if not line or len(line) < 3:
            continue
        
        # Print first few characters of each line for debugging
        print(f"Processing line: {line[:50]}...")
        
        # Check if line starts with a county name
        county_found = None
        for county in counties:
            if line.startswith(county):
                county_found = county
                break
        
        if county_found:
            print(f"Found county: {county_found}")
            # Extract all numbers from the line
            numbers = re.findall(r'[\d,]+', line)
            
            if len(numbers) >= 2:  # At least county and total deaths
                try:
                    # Clean up numbers (remove commas)
                    clean_numbers = [int(num.replace(',', '')) for num in numbers]
                    print(f"Found numbers for {county_found}: {clean_numbers}")
                    
                    # Create data row
                    row = {
                        'Year': year,
                        'County': county_found,
                        'Total_Deaths': clean_numbers[0] if clean_numbers else 0
                    }
                    
                    # Add cause-specific deaths
                    causes = [
                        'Diseases_of_Heart', 'Malignant_Neoplasms', 'Accidents', 'COVID_19',
                        'Cerebrovascular_Diseases', 'Chronic_Lower_Respiratory_Diseases',
                        'Alzheimers_Disease', 'Diabetes_Mellitus', 'Nephritis_Nephrotic_Syndrome_Nephrosis',
                        'Influenza_and_Pneumonia', 'Septicemia', 'Intentional_Self_Harm',
                        'Chronic_Liver_Disease_Cirrhosis', 'All_Other_Causes'
                    ]
                    
                    # Map numbers to causes (skip first number which is total deaths)
                    for i, cause in enumerate(causes):
                        if i + 1 < len(clean_numbers):
                            row[cause] = clean_numbers[i + 1]
                        else:
                            row[cause] = 0
                    
                    data.append(row)
                    
                except (ValueError, IndexError) as e:
                    print(f"Error parsing line '{line}': {e}")
                    continue
    
    print(f"Found data for {len(data)} counties")
    return data

def process_all_pdfs_improved():
    """Process all PDF files with improved parsing"""
    current_dir = os.path.dirname(os.path.abspath(__file__))
    output_dir = os.path.join(current_dir, "csv_output")
    os.makedirs(output_dir, exist_ok=True)
    print(f"Output directory: {output_dir}")
    
    # Get all PDF files
    pdf_files = [f for f in os.listdir(current_dir) if f.endswith('.pdf')]
    print(f"Found PDF files: {pdf_files}")
    
    all_data = []
    
    for pdf_file in pdf_files:
        print(f"\nProcessing {pdf_file}...")
        
        # Extract year from filename
        year_match = re.search(r'20\d{2}', pdf_file)
        if year_match:
            year = int(year_match.group())
        else:
            print(f"Could not extract year from {pdf_file}")
            continue
        
        # Extract text from PDF
        pdf_path = os.path.join(current_dir, pdf_file)
        text = extract_text_from_pdf(pdf_path)
        if text is None:
            continue
        
        # Parse the data with improved parser
        data = parse_death_data_improved(text, year)
        
        if data:
            # Create DataFrame
            df = pd.DataFrame(data)
            
            # Save to CSV
            csv_filename = f"death_data_{year}.csv"
            csv_path = os.path.join(output_dir, csv_filename)
            df.to_csv(csv_path, index=False)
            print(f"Saved {csv_filename} with {len(data)} records")
            
            all_data.extend(data)
        else:
            print(f"No data extracted from {pdf_file}")
    
    # Create combined CSV with all years
    if all_data:
        combined_df = pd.DataFrame(all_data)
        combined_path = os.path.join(output_dir, "all_years_death_data.csv")
        combined_df.to_csv(combined_path, index=False)
        print(f"Saved combined file: all_years_death_data.csv with {len(all_data)} total records")
    
    return output_dir

if __name__ == "__main__":
    print("Starting improved PDF to CSV conversion...")
    output_directory = process_all_pdfs_improved()
    print(f"Conversion complete! Files saved in: {output_directory}") 