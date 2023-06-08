#!/bin/bash

# test integer: evaluate the value of an int

#INT=-5
read -ep 'Please enter a number: ' INT

# regex check for numbers only
# exclamation mark checks for negative equality
# regex checks for starts with + or - as optional
# then any number of digits
# =~ is the sign for checking for regex match
if ! [[ $INT  =~ ^[+-]?[0-9]+$ ]]; then
    echo "Please enter a valid number" >&2
    exit 1
fi

if [ -z "$INT" ]; then
    echo "INT is empty." >&2
    exit 1
fi

if [ "$INT" -eq 0 ]; then
    echo "INT is zero"
else
    if [ "$INT" -lt 0 ]; then
        echo "INT is negative"
    else
        echo "INT is positive"
    fi
    # if the reminder of dividing INT by 2
    # is equal to zero then the INT is even
    if [ $((INT % 2)) -eq 0 ]; then
        echo "INT is even."
    else
        echo "INT is odd."
    fi
fi
