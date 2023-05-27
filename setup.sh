#!/bin/bash

# Run the build_image.sh script
chmod +x build_image.sh
./build_image.sh

# Check if the build was successful
if [ $? -ne 0 ]; then
    echo "Build script failed. Exiting."
    exit 1
fi

# Create a symlink for runContainer.sh called mediasite-dl
chmod +x runContainer.sh
sudo ln -sf $(pwd)/runContainer.sh /usr/local/bin/mediasite-dl
# Check if the symlink was created successfully
if [ $? -eq 0 ]; then
    echo "Symlink created successfully."
else
    echo "Failed to create symlink. Exiting."
    exit 1
fi
