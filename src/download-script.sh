#!/bin/bash

# Define a function to display the usage of the script
function usage {
  echo "Usage: $0 [audio_url] [video_url] [output_file]"
  echo "Downloads audio and video from provided m3u8 links and merges them into a single mp4 file"
}

# Check the number of arguments passed
if [ "$#" -ne 3 ]; then
    usage
    exit 1
fi

audio_url=$1
video_url=$2
output_file=$3

# Ensure the output file has the .mp4 extension
output_file=$(echo "${output_file}" | sed -r 's/(.*)(\.[^\.]+)?$/\1.mp4/')

# Download the audio
echo "Downloading audio..."
ffmpeg -i $audio_url -c:a copy -bsf:a aac_adtstoasc audio.mp4

# Download the video
echo "Downloading video..."
ffmpeg -i $video_url -c:v copy video.mp4

# Merge the audio and video
echo "Merging audio and video..."
ffmpeg -i video.mp4 -i audio.mp4 -c:v copy -c:a aac -strict experimental $output_file

echo "Merging completed. Output file: $output_file"

# Clean up temporary files
rm audio.mp4 video.mp4
"content/