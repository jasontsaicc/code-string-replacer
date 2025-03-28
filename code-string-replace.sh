#!/bin/bash

# - Read -find the string to search for
# - Read -replace the string to replace with
# - Read -exclude the file extensions or folders to exclude (separated by commas)

FIND_STRING=""
REPLACE_STRING=""
EXCLUDE_PATTERNS=""

# Read CLI arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --find)
            FIND_STRING="$2"
            shift 2
            ;;
        --replace)
            REPLACE_STRING="$2"
            shift 2
            ;;
        --exclude)
            IFS=',' read -ra EXC:LUDE_PATTERNS <<< "$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
done

# Ensure -find and -replace are not empty
# check required params 
if [[ -z "$FIND_STRING" || -z "$REPLACE_STRING" ]]; then
    echo "Usage: $0 --find <string> --replace <string> [--exclude ext1, folder2, ...]"
    exit 1
fi

echo "Find: $FIND_STRING"
echo "Replace: $REPLACE_STRING"
echo "Exclude: ${EXCLUDE_PATTERNS[@]}"

# 3. Create a counter: replace_count = 0

# 4. Create a log file: log_file = "replace_log_<timestamp>.log"

# 5. Use the find command to list all files

# 6. Display the total number of replacements made