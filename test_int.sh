#!/bin/bash

# test int

echo -n "Please enter an integer -> "
read int

# check int is int
if [[ "$int" =~ ^-?[0-9]+$ ]]; then
    ## (( )) is used for ints
    # to perform arithmetic truth tests
    if ((int == 0)); then
        echo "int is zero"
    else
        if ((int < 0)); then
            echo "int is negative"
        else
            echo "int is positive"
        fi
        # if int divided by 2 has no remainder
        if (( ((int % 2)) == 0)); then
            echo "int is even"
        else
            echo "int is odd"
        fi
    fi
else
    echo "int is not an integer." >&2
    exit 1
fi
