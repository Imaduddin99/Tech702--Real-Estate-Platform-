import pandas as pd
import psycopg2
from pathlib import Path
from getpass import getpass

# Location of cleaned CSV file
data_folder = Path(__file__).parent.parent / "data"
file_path = data_folder / "properties_cleaned.csv"

# Read transformed data
df = pd.read_csv(file_path)

print("Cleaned records ready to load:", len(df))

# Ask for PostgreSQL password securely
password = getpass("Enter PostgreSQL password: ")

# Connect to PostgreSQL
connection = psycopg2.connect(
    host="localhost",
    database="tech702_real_estate",
    user="postgres",
    password=password
)

cursor = connection.cursor()

# Insert each cleaned record
for _, row in df.iterrows():

    cursor.execute(
        """
        INSERT INTO properties
        (property_id, builder_id, property_name, location, price)
        VALUES (%s, %s, %s, %s, %s)
        ON CONFLICT (property_id) DO NOTHING;
        """,
        (
            int(row["property_id"]),
            int(row["builder_id"]),
            row["property_name"],
            row["location"],
            float(row["price"])
        )
    )

connection.commit()

print("Data loaded successfully into PostgreSQL!")
print("Records processed:", len(df))

cursor.close()
connection.close()

print("Database connection closed successfully.")