#!/bin/bash

number=1

# debugging with extra echo statements is always useful:
echo "number= '$number'" # DEBUG

# the set -x and set +x enable the debug tracing output to the terminal

set -x # Turn on tracing
if [ $number = 1 ]; then
    echo "Number is equal to 1."
else
    echo "Number is not equal to 1."
fi
set +x # Turn off tracing
