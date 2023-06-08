#!/bin/bash

FILE="example.txt"

# check for command line args
# if args not equal to 1 then exit
if [ $# -ne 1 ]; then
    echo "No command line args passed"
    echo "usage: test_file.sh path-to-file-to-test"
    exit 1
else
    # assign file to first arg
    FILE="$1"
fi

if [[ $FILE == *.txt ]]; then
    echo "$FILE has txt extension"
else
    echo "$FILE does not have txt extension"
fi
