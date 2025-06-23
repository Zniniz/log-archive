#!/bin/bash

# Welcome to the Log Archive Tool

# Default to /var/log #if no directory is supplied
LOGDIR="${1:-/var/log}"

# Verify it actually exists
if [ ! -d "$LOGDIR" ]; then
  echo "Error: '$LOGDIR' is not a directory." >&2
  echo "Usage: $0 [log-directory]" >&2
  exit 1
fi

# Change into it
cd "$LOGDIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive Directory
ARCHIVE_DIR="/usr/archives"
mkdir -p "$ARCHIVE_DIR"

# Archive file name 
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Create the compressed Archive
tar -czvf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOGDIR"

LOG_FILE="/usr/archives.log"

echo "$(date) - Archived $LOGDIR to $ARCHIVE_DIR/$ARCHIVE_NAME" >> "$LOG_FILE"

echo "Archiving logs in $ARCHIVE_DIR/$ARCHIVE_NAME..."

