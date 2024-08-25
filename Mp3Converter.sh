#!/bin/bash

# Check if the user provided a file name as an argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_file.m4a>"
  exit 1
fi

# Input file name
input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: File '$input_file' not found!"
  exit 1
fi

# Get the base name of the input file (without extension)
base_name=$(basename "$input_file" .m4a)

# Output file name
output_file="${base_name}.mp3"

# Convert the M4A file to MP3
ffmpeg -i "$input_file" -codec:a libmp3lame -qscale:a 2 "$output_file"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
  echo "Conversion successful! Output file: $output_file"
else
  echo "Error: Conversion failed!"
fi
