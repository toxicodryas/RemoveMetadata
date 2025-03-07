# RemoveMetadata

## Overview

RemoveMetadata is a bash script designed to protect privacy by removing sensitive metadata from image files. This script was specifically developed for sanitizing JPEG images used on the tobese.org website. It automatically strips location data and other embedded information from images in a specified directory, ensuring that no sensitive metadata is inadvertently published when images are uploaded to the site.

Digital photos often contain hidden metadata such as GPS coordinates, camera information, and timestamps that could potentially compromise privacy. This script offers a simple solution to sanitize your images before sharing them online.

## Features

- Automatically processes all images in a specified directory
- Removes GPS location data (latitude and longitude)
- Strips all other metadata tags for comprehensive privacy protection
- Creates backups of original files and optionally removes them upon completion
- Provides clear terminal output showing which files are being processed

## Requirements

- Linux or macOS environment with bash shell
- [ExifTool](https://exiftool.org/) installed on your system

## Installation

1. Ensure ExifTool is installed on your system:

   ```bash
   # Debian/Ubuntu
   sudo apt install libimage-exiftool-perl
   
   # macOS with Homebrew
   brew install exiftool
   
   # Fedora/RHEL/CentOS
   sudo dnf install perl-Image-ExifTool
   ```

2. Download the script and make it executable:

   ```bash
   chmod +x remove_metadata.sh
   ```

## Usage

1. Open the script in a text editor and set the `directory` variable to the path containing your images:

   ```bash
   # Set the directory to scan for images
   directory="/your/image/directory"
   ```

2. Run the script:

   ```bash
   ./remove_metadata.sh
   ```

3. The script will process all JPG files in the specified directory and display its progress in the terminal.

## Customization

The script is currently configured to process `.jpg` files. You can easily modify it to handle other image formats:

1. Change the file extension in both the file check and the processing loop:

   ```bash
   # For PNG files
   files=("$directory"/*.png)
   ...
   for image in "$directory"/*.png; do
   ```

2. To process multiple file types, you can modify the script to use a more complex pattern or create separate loops for each file type.

3. If you want to keep the backup files created by ExifTool, comment out or remove the final line:

   ```bash
   # rm -f "$directory"/*.jpg_original
   ```

## How It Works

The script performs the following operations:

1. Verifies that the specified directory exists
2. Checks if there are any JPG files in the directory
3. Iterates through each JPG file and runs ExifTool to remove:
   - GPS latitude data
   - GPS longitude data
   - All other metadata tags
4. Optionally removes the backup files created by ExifTool

ExifTool creates backup files with the `.jpg_original` extension during processing. By default, these backups are deleted upon completion, but you can preserve them by commenting out the final line of the script.

## Privacy Considerations

While this script removes the most common metadata from images, it's important to understand that:

1. Some image formats may contain metadata in proprietary formats not fully processed by ExifTool
2. Images may contain visual information that could reveal location or personal details
3. For extremely sensitive applications, consider using specialized privacy tools

## Contributing

Feel free to fork this project, submit pull requests, or suggest improvements by opening an issue.

## License

This script is provided as-is under the MIT License. You are free to use, modify, and distribute it as needed.
