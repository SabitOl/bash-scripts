#!/bin/bash
set -e

# declare disk space threshold 
THRESHOLD=80

# Get each partition name and disk use % for all partitions
# Remove the partitions header
# Get use % at column 5
# Loop through the partition

df -h | tail -n +2 | awk '{print $1, $5}' | while read -r name usage; do

# remove % to do math comparison
raw_usage=${usage%?}

if [[ raw_usage -gt $THRESHOLD ]]; then
   echo "ALERT: $name partition is at $usage. This is more than ${THRESHOLD}%."

else
   echo "OK: $name partition is at $usage. This is within safe limits."
fi

done
