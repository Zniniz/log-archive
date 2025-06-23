#!/bin/bash

# Welcome to the Log Archival Tool

# Default to /var/log if no directory is supplied
LOGDIR="${1:-/var/log}"

# Verify it actually exists
if [ ! -d "$LOGDIR" ]; then
  echo "Error: '$LOGDIR' is not a directory." >&2
  echo "Usage: $0 [log-directory]" >&2
  exit 1
fi

# Change into it
cd "$LOGDIR"
tail -n 10 messages
echo "Archiving logs in $(pwd)..."
# …rest of your archival logic…

