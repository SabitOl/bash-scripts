#!/bin/bash
set -e

# (...) this treats its content as one
# | serves as OR
FORBIDDEN="BEGIN (PRIVATE|RCA|EC) KEY|AWS_SECRET_ACCESS_KEY"

# Get file names in staged area before commit
# Run it and save the file names in FILES
FILES=$(git diff --cached --name-only)

for FILE in $FILES; do
   
   # "q" silence grep result print to the screen
   # "E" helps bash treat "|" in FORBIDDEN as OR and not the literal "|"
   if grep -qE "$FORBIDDEN" "$FILE"; then
      echo "You're about to commit a key in $FILE!. Please take a look."
      echo "Commit blocked."
    
    # This stops the commit. Git only understands exit code
    exit 1

   fi

done

# if bash gets here, means no KEY was found
exit 0
