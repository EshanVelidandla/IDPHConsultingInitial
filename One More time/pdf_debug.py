import PyPDF2
import re
import sys

def debug_pdf_content(pdf_path):
    """Debug function to examine PDF content"""
    try:
        with open(pdf_path, 'rb') as file:
            pdf_reader = PyPDF2.PdfReader(file)
            text = ""
            for page in pdf_reader.pages:
                text += page.extract_text()
        
        print(f"=== Content from {pdf_path} ===")
        print("First 2000 characters:")
        print(text[:2000])
        print("\n" + "="*50)
        
        # Look for patterns
        lines = text.split('\n')
        print(f"Total lines: {len(lines)}")
        
        # Look for lines with numbers
        number_lines = []
        for i, line in enumerate(lines[:50]):  # First 50 lines
            if re.search(r'\d', line):
                number_lines.append(f"Line {i}: {line}")
        
        print("Lines with numbers (first 50 lines):")
        for line in number_lines[:20]:
            print(line)
            
    except Exception as e:
        print(f"Error reading {pdf_path}: {e}")

if __name__ == "__main__":
    # Get PDF files from command line arguments
    if len(sys.argv) > 1:
        test_files = sys.argv[1:]
    else:
        test_files = [
            "causes-death-resident-county-2015-3817.pdf",
            "death-causes-2018.pdf"
        ]
    
    for pdf_file in test_files:
        debug_pdf_content(pdf_file) 