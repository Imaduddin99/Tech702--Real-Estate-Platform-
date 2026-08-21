import pandas as pd
from pathlib import Path

# File paths
data_folder = Path(__file__).parent.parent / "data"
input_file = data_folder / "properties.csv"
output_file = data_folder / "properties_cleaned.csv"

# Read extracted data
df = pd.read_csv(input_file)

print("Records before cleaning:", len(df))

# Remove duplicate records
df = df.drop_duplicates()

# Remove records with missing important values
df = df.dropna(subset=["property_name", "location", "price"])

# Clean text fields
df["property_name"] = df["property_name"].str.strip()
df["location"] = df["location"].str.strip()

# Make sure price contains numeric values
df["price"] = pd.to_numeric(df["price"], errors="coerce")

# Remove records with invalid prices
df = df.dropna(subset=["price"])

print("Records after cleaning:", len(df))

print("\nCleaned Data:")
print(df)

# Save transformed data
df.to_csv(output_file, index=False)

print("\nTransformation completed successfully!")
print("Cleaned file created:", output_file)