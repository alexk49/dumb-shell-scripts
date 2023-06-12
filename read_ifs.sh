#!/bin/bash

# IFS stands for internal field seperator

# this can change the default field seperator

# read-ifs: read fields from a file

FILE=/etc/passwd

read -e -p "Enter a username > " -i $USER user_name

# this assigns the results of grep to a variable
file_info="$(grep "^$user_name:" $FILE)"

if [ -n "$file_info" ]; then
    # the <<< indicates a here string
    # you can't pass read input via a pipe
    IFS=":" read user pw uid gid name home shell <<< "$file_info"
        echo "User = '$user'"
        echo "UID = '$uid'"
        echo "GID = '$gid'"
        echo "Full name = '$name'"
        echo "Home dir. = '$home'"
        echo "Shell = '$shell'"
else
    echo "No such user '$user_name'" >&2
    exit 1
fi
