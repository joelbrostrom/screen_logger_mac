#!/bin/bash

# Give the process a name
lsappinfo setinfo $$ --name "screen_logger"

# Remove black images
allFoldersPath="<USER>/Scripts/screen_logger/screen_logs/."
find "$allFoldersPath" -type f -name "*.jpg" -size -14k -delete

while [ 1 ];
do
    # Create new folder for today if it not already exist
    foldertPath="<USER>/Scripts/screen_logger/screen_logs/$(date +%d\-%m\-%Y)"
    mkdir -p "$foldertPath"

    # Capture screenshot every 30 seconds
    vardate=$(date +%d\-%m\-%Y\_%H.%M.%S);
    filePath="$foldertPath/$vardate.jpg"; 
    screencapture -t jpg -x "$filePath";
    sips -Z 720 "$filePath";
    sleep 30;
done
