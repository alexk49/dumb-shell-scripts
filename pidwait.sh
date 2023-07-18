#!/bin/bash
# Write a bash function called pidwait that takes a pid and waits until the given process completes. You should use sleep to avoid wasting CPU unnecessarily.

if [[ "$#" -ne 1 ]]; then
    echo "usage: $(basename $0) process-id"
    exit
fi

pid="$1"

kill -0 "$pid"

while [[ "$?" -gt 0 ]]; do
    echo "$pid ongoing"
    kill -0 "$pid"
done

echo "$pid finished"
