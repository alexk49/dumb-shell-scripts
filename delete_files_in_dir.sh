#!/bin/bash

# delete files in directory

# check for command line args
# if args not equal to 1 then exit
if [ $# -ne 1 ]; then
    echo "No command line args passed"
    echo "usage: delete_files_in_dir.sh path-to-dir"
    exit 1
else
    # assign file to first arg
    dir_name="$1"
fi

# check dir name exists
if [[ -d $dir_name ]]; then
    if cd $dir_name; then
        # this prevents characters starting with a hyphen
        # being interpreted as a command option
        # and is a good general rule to include in wild cards

        # the echoing of the command is a good way of testing output
        # before running the potentially dangerous script
        echo rm ./* # TESTING
        # alternatively you can ls before you rm as a test
        echo "Files to be deleted: "
        ls -l ./*
    else
        echo "Cannot cd to '$dir_name'" >&2
        exit 1
    fi
else
    echo "no such directory: '$dir_name'" >&2
    exit 1
fi
exit # TESTING
