#!/bin/bash

# Define a function to display the usage of the script
function usage {
  echo "Usage: $0 --audio_url [audio_url] --video_url [video_url] --output_file [output_file]"
  echo "Runs a Docker container to download audio and video from provided m3u8 links and merge them into a single mp4 file"
}

# Parse the command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --audio_url) audio_url="$2"; shift ;;
        --video_url) video_url="$2"; shift ;;
        --output_file) output_file="$2"; shift ;;
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
docker run -v $(pwd):/app/content mediasite-dl $audio_url $video_url "content/${output_file}"
