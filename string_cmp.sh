#!/bin/bash

# test-string: evaluate the value of a string

# take input from user
printf "%s" "What's your answer? "
read ANSWER

# -n checks if the length of string is greater than zero
# if string not greater than zero exit program
# echo output redirected to standard error
if [ ! -n "$ANSWER" ]; then
    echo "There is no answer." >&2
    exit 1
fi

# if length of answer string is zero
# then exit the program
if [ -z "$ANSWER" ]; then
    echo "There is no answer." >&2
    exit 1
fi


# check for equality
# == can also be used
if [ "$ANSWER" = "yes" ]; then
    echo "The answer is YES."
elif [ "$ANSWER" = "no" ]; then
    echo "The answer is no."
elif [ "$ANSWER" = "maybe" ]; then
    echo "The answer is maybe."
else
    echo "The answer is unknown"
fi
