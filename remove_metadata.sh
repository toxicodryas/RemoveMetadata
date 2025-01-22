#!/bin/bash

# Set the directory to scan for images
directory="/home/ben/ProgrammingProjects/Tobese/images"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory $directory does not exist!"
    exit 1
fi

# Check if there are any .jpg files in the directory
shopt -s nullglob
files=("$directory"/*.jpg)
if [ ${#files[@]} -eq 0 ]; then
    echo "No .jpg files found in $directory"
    exit 1
fi

# Iterate through all .jpg files in the specified directory
for image in "$directory"/*.jpg; do
    # Check if the file exists
    if [ -f "$image" ]; then
        echo "Removing location metadata from: $image"
        # Run exiftool to remove location metadata
        exiftool -GPSLatitude= -GPSLongitude= -all:all "$image"
    fi
done

# Optionally, delete the backup files created by exiftool
rm -f "$directory"/*.jpg_original

