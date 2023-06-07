#/bin/bash

# test-file: evaluate the status of a file

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

# check if file exists
if [ -e "$FILE" ]; then
    # check if regularly file
    if [ -f "$FILE" ]; then
        echo "$FILE is a regular file."
    fi
    # check if directory
    if [ -d "$FILE" ]; then
        echo "$FILE is a directory"
    fi
    # check if file is readable by current user
    if [ -r "$FILE" ]; then
        echo "$FILE is readable."
    fi
    # check if file is writable by current user
    if [ -w "$FILE" ]; then
        echo "$FILE is writable"
    fi
    # check if file is executaable
    if [ -x "FILE" ]; then
        echo "$FILE is executable/searchalbe"
    fi
else
    echo "$FILE does not exist"
    exit 1
fi

exit
