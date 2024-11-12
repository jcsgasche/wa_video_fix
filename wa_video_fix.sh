#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_video>"
  exit 1
fi

# Get the input file and filename details
input_file="$1"
filename="${input_file%.*}"
extension="${input_file##*.}"

# Create the output filename
output_file="${filename}-4wa.${extension}"

# Run ffmpeg command
ffmpeg -i "$input_file" -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p "$output_file"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Video processed successfully. Saved as $output_file"
else
  echo "An error occurred during video processing."
  exit 1
fi
