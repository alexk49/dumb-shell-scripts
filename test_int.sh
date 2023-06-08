#!/bin/bash

# test int

INT=-5

# check int is int
if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
    ## (( )) is used for ints
    # to perform arithmetic truth tests
    if ((INT == 0)); then
        echo "INT is zero"
    else
        if ((INT < 0)); then
            echo "INT is negative"
        else
            echo "INT is positive"
        fi
        # if int divided by 2 has no remainder
        if (( ((INT % 2)) == 0)); then
            echo "INT is even"
        else
            echo "INT is odd"
        fi
    fi
else
    echo "INT is not an integer." >&2
    exit 1
fi
