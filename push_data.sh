#!/bin/bash
# Set your MongoDB connection URI as an environment variable
export MONGODB_URI="mongodb+srv://Ganesh:mRamX9lmMcTd8GUt@cluster0.h1e3iec.mongodb.net/"
# Path to your JSON data file
JSON_FILE="./data.json"
# MongoDB collection name
COLLECTION_NAME="shell"
# Check if the MongoDB URI is set
if [ -z "$MONGODB_URI" ]; then
  echo "Error: MongoDB URI not set."
  exit 1
fi
# Check if the JSON file exists
if [ ! -f "$JSON_FILE" ]; then
  echo "Error: JSON data file not found."
  exit 1
fi
# Push data to MongoDB
mongoimport --uri "$MONGODB_URI" --collection "$COLLECTION_NAME" --file "$JSON_FILE" --jsonArray
# Check the exit code of mongoimport
if [ $? -eq 0 ]; then
  echo "Data imported successfully into MongoDB."
else
  echo "Error: Failed to import data into MongoDB."
  exit 1
fi
