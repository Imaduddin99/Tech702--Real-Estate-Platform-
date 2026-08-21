import pandas as pd
from pathlib import Path

# Find the CSV file inside the ETL/data folder
file_path = Path(__file__).parent.parent / "data" / "properties.csv"

# Extract data from CSV
df = pd.read_csv(file_path)

print("Data extracted successfully!")
print(df)

print("\nTotal records:", len(df))