import PyPDF2
import pandas as pd
import re
import os
from pathlib import Path

def extract_text_from_pdf(pdf_path):
    """Extract text from PDF file"""
    try:
        with open(pdf_path, 'rb') as file:
            pdf_reader = PyPDF2.PdfReader(file)
            text = ""
            for page in pdf_reader.pages:
                text += page.extract_text()
        return text
    except Exception as e:
        print(f"Error reading {pdf_path}: {e}")
        return None

def parse_death_data(text, year):
    """Parse death data from extracted text"""
    lines = text.split('\n')
    data = []
    
    # Look for county data patterns
    county_pattern = r'^([A-Z][a-z\s\.]+(?:County|DeWitt|DuPage|LaSalle|McHenry|McLean|Rock Island|St\. Clair|Stark|Stephenson|Suburban Cook|Tazewell|Vermilion|Wabash|Warren|Washington|Wayne|White|Whiteside|Will|Williamson|Winnebago|Woodford))'
    
    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        # Try to match county names
        county_match = re.match(county_pattern, line)
        if county_match:
            county = county_match.group(1).strip()
            
            # Extract numbers from the line
            numbers = re.findall(r'[\d,]+', line)
            
            if len(numbers) >= 2:  # At least county and total deaths
                try:
                    # Clean up numbers (remove commas)
                    clean_numbers = [int(num.replace(',', '')) for num in numbers]
                    
                    # Create data row
                    row = {
                        'Year': year,
                        'County': county,
                        'Total_Deaths': clean_numbers[0] if clean_numbers else 0
                    }
                    
                    # Add cause-specific deaths if available
                    causes = [
                        'Diseases_of_Heart', 'Malignant_Neoplasms', 'Accidents', 
                        'Cerebrovascular_Diseases', 'Chronic_Lower_Respiratory_Diseases',
                        'Alzheimers_Disease', 'Diabetes_Mellitus', 'Influenza_and_Pneumonia',
                        'Nephritis_Nephrotic_Syndrome_Nephrosis', 'Intentional_Self_Harm',
                        'Chronic_Liver_Disease_Cirrhosis', 'Septicemia', 'All_Other_Causes'
                    ]
                    
                    for i, cause in enumerate(causes, 1):
                        if i < len(clean_numbers):
                            row[cause] = clean_numbers[i]
                        else:
                            row[cause] = 0
                    
                    data.append(row)
                    
                except (ValueError, IndexError):
                    continue
    
    return data

def process_all_pdfs():
    """Process all PDF files in the One More time directory"""
    pdf_dir = Path("One More time")
    output_dir = Path("csv_output")
    output_dir.mkdir(exist_ok=True)
    
    # Get all PDF files
    pdf_files = list(pdf_dir.glob("*.pdf"))
    
    all_data = []
    
    for pdf_file in pdf_files:
        print(f"Processing {pdf_file.name}...")
        
        # Extract year from filename
        year_match = re.search(r'20\d{2}', pdf_file.name)
        if year_match:
            year = int(year_match.group())
        else:
            print(f"Could not extract year from {pdf_file.name}")
            continue
        
        # Extract text from PDF
        text = extract_text_from_pdf(pdf_file)
        if text is None:
            continue
        
        # Parse the data
        data = parse_death_data(text, year)
        
        if data:
            # Create DataFrame
            df = pd.DataFrame(data)
            
            # Save to CSV
            csv_filename = f"death_data_{year}.csv"
            csv_path = output_dir / csv_filename
            df.to_csv(csv_path, index=False)
            print(f"Saved {csv_filename} with {len(data)} records")
            
            all_data.extend(data)
        else:
            print(f"No data extracted from {pdf_file.name}")
    
    # Create combined CSV with all years
    if all_data:
        combined_df = pd.DataFrame(all_data)
        combined_path = output_dir / "all_years_death_data.csv"
        combined_df.to_csv(combined_path, index=False)
        print(f"Saved combined file: all_years_death_data.csv with {len(all_data)} total records")
    
    return output_dir

if __name__ == "__main__":
    print("Starting PDF to CSV conversion...")
    output_directory = process_all_pdfs()
    print(f"Conversion complete! Files saved in: {output_directory}") 