#!/bin/bash

# read default - supply a default value if user presses enter key

# if the user just presses enter then:
# this will default to just the default username
read -e -p "What is your user name? " -i $USER
echo "You answered: '$REPLY'"
