from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse, JSONResponse
import pandas as pd
import os

app = FastAPI()

# Allow CORS for local frontend development
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Define data directories
data_dir = os.path.join(os.path.dirname(__file__), "static")
death_rates_dir = os.path.join(data_dir, "death_rate_tables")

# Create death_rates_dir if it doesn't exist
os.makedirs(death_rates_dir, exist_ok=True)

@app.get("/")
def read_root():
    return {"message": "Illinois Death Data API is running!"}

# Endpoint to serve Illinois counties GeoJSON
@app.get("/geojson")
def get_geojson():
    geojson_path = os.path.join(data_dir, "illinois-counties.geojson")
    if os.path.exists(geojson_path):
        return FileResponse(geojson_path)
    return {"error": "GeoJSON file not found"}

# Endpoint to get death rates by cause
@app.get("/death_rates")
def get_death_rates(cause: str):
    try:
        # Convert cause to file name format
        file_name = f"{cause}_death_rates_by_county_year.csv"
        file_path = os.path.join(death_rates_dir, file_name)
        
        if not os.path.exists(file_path):
            return JSONResponse(
                status_code=404,
                content={"error": f"Data not found for cause: {cause}"}
            )
        
        # Read CSV with proper handling of empty cells
        df = pd.read_csv(file_path, na_values=['', ' '])
        
        # Convert DataFrame to list of records (one per county)
        data = df.fillna(0).to_dict(orient='records')
        
        return JSONResponse(content=data)
    except Exception as e:
        print(f"Error processing request: {str(e)}")
        return JSONResponse(
            status_code=500,
            content={"error": f"Failed to process data: {str(e)}"}
        )

# Placeholder: Add endpoints for data and GeoJSON here 