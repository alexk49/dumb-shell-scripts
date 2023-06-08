#!/bin/bash

# read secret: input a secret pass pharse

# -t option gives user 10 seconds to enter pharse
# -p option means it is a string prompt
# -s means it is silent
# meaning the entered characters are not shown on screen
if read -t 10 -sp "Enter secret passphrase > " secret_pass; then
    echo -e "\nSecret passpharse = '$secret_pass'"
else
    echo -e "\nInput timed out" >&2
    exit 1
fi
