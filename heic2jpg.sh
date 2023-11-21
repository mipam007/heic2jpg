#!/bin/bash

# Define the input directory where HEIC files are stored
input_directory="/Users/$USER/Downloads"

# Define the output directory for JPG files
output_directory="$input_directory/output"

# Check if the input directory exists
if [ ! -d "$input_directory" ]; then
    echo "Input directory does not exist."
    exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$output_directory"

# Check if the output directory was created successfully
if [ ! -d "$output_directory" ]; then
    echo "Failed to create output directory."
    exit 1
fi

# Loop through all HEIC files in the input directory
for file in "$input_directory"/*.HEIC; do
    # Extract the filename without extension
    filename=$(basename "$file" .HEIC)

    # Convert the file to JPG format
    sips -s format jpeg "$file" --out "$output_directory/$filename.jpg"
done

echo "Conversion completed."
