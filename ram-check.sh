#!/bin/bash
set -e

# Set threshold 
THRESHOLD=90

# Get the percentage of RAM available
# Divide "used" by "total" and multiply by 100

RAM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Discard the fraction after the dot
CURRENT_USAGE=${RAM_USAGE%.*}

if (( CURRENT_USAGE > THRESHOLD )); then
   # zenity displays the message and disappears only when you press "Ok"
   # I prefer this over notify-send. You can miss the brief notify-send message
   zenity --info --title="RAM WATCHDOG" --text="Your RAM usage just passed ${THRESHOLD}%"

   echo "$(date): RAM ALERT at ${THRESHOLD}%" >> ~/ram_log.txt

else 
   echo "$(date): RAM under ${THRESHOLD}%. RAM at ${CURRENT_USAGE}%."
fi
