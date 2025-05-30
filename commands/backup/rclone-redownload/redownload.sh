#!/bin/bash

# The remote name
REMOTE="pcloud-crypt"

# Read each line from the file
while IFS= read -r remote_path; do
    # Remove the "prn/chaturbate/" prefix
    rel_path="${remote_path#prn/chaturbate/}"

    # Create the target directory if it doesn't exist
    # mkdir -p "$(dirname "$HOME/$rel_path")"

    # if "$HOME/$rel_path" exists, skip the download
    if [ -e "$HOME/$rel_path" ]; then
        echo "Skipping $HOME/$rel_path, already exists."
        continue
    fi

    # Move the file from the remote to the local home directory
    rclone move "$REMOTE:$remote_path" $(dirname "$HOME/$rel_path") --progress
    # echo "rclone move $REMOTE:$remote_path $(dirname $HOME/$rel_path)"
done < redownload
