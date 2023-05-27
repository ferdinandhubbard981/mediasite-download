# Use a base image with ffmpeg pre-installed
FROM jrottenberg/ffmpeg

# Set the working directory
WORKDIR /usr/src/app

# Copy the script to the docker container
COPY src/download-script.sh .

# Provide execute permissions for the script
RUN chmod +x download-script.sh

# Run the script
ENTRYPOINT ["/usr/src/app/download-script.sh"]
