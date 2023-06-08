#/bin/bash

# read single: read multiple values into default variable

# the -p prompt displays a prompt for input using the string prompt

read -p "Enter one or more values: "

# if no variable given to read then it defaults to the REPLY var

echo "Reply = '$REPLY'"
