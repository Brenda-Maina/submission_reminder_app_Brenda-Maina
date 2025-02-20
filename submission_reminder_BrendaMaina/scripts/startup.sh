#!/bin/bash
# Startup script for the submission reminder app
source "./config/config.env"
echo "Starting the $APP_NAME..."
echo "Loading student submission data..."
cat "./data/submissions.txt"
echo "Application is now running."
