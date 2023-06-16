#!/bin/bash

# longest word2: find longest string in a file

# this eliminates the use of the shift command
# by just looping through the parameters passed
# in the command line args

for i; do
    if [[ -r "$i" ]]; then
        max_word=
        max_len=
        for j in $(strings "$i"); do
            len="$(echo -n "$j" | wc -c)"
            if (( len > max_len )); then
                max_len="$len"
                max_word="$j"
            fi
        done
        echo "$i: '$max_word' ($max_len characters)"
    fi
done
