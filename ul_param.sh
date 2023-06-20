#!/bin/bash

# ul param - demonstrate different case conversions via parameter expansion

if [[ "$1" ]]; then
    # this expands into all lowercase
    echo "${1,,}"
    # this changes first char into lowercase
    echo "${1,}"
    # this expands to all uppercase
    echo "${1^^}"
    # this expands to title case
    # (just first letter uppercase)
    echo "${1^}"
fi
