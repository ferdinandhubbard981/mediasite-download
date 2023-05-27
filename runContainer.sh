#!/bin/bash

# Define a function to display the usage of the script
function usage {
  echo "Usage: mediasite-dl -v [video_url] -a [audio_url] -o [output_file_name.mp4]"
}

# Parse the command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -v) video_url="$2"; shift ;;
        -a) audio_url="$2"; shift ;;
        -o) output_file="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; usage; exit 1 ;;
    esac
    shift
done

# Verify that all arguments were provided
if [ -z "$audio_url" ] || [ -z "$video_url" ] || [ -z "$output_file" ]; then
    usage
    exit 1
fi

# Execute the Docker command
docker run -v $(pwd):/app/content --rm mediasite-dl $audio_url $video_url "content/${output_file}"
