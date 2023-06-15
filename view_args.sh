#!/bin/bash

# view command line parameters

echo "Number of args given: $#"

count=1

while [[ $# -gt 0 ]]; do
    echo "Argument $count = $1"
    count=$((count + 1))
    shift
done
