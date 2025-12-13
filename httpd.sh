#!/bin/bash

whoami

# Update packages
sudo yum update -y

# Install httpd if not installed
if ! rpm -q httpd >/dev/null 2>&1; then
    echo "httpd is not installed. Installing..."
    sudo yum install httpd -y
else
    echo "httpd is already installed."
fi

# Check httpd status
echo "Checking httpd status..."
sudo systemctl status httpd >/dev/null 2>&1

if [[ $? -eq 0 ]]; then
    echo "httpd is already running."
else
    echo "httpd is NOT running. Starting service..."
    sudo systemctl start httpd

    # Check again after starting
    if [[ $? -eq 0 ]]; then
        echo "httpd started successfully."
    else
        echo "Failed to start httpd. Check logs."
        exit 1
    fi
fi

# Enable service on boot
