#!/bin/bash

# getting average boot times of last 10 boots (sort of)

num=$(journalctl | sed -nr "s/.*Startup finished in ([0-9\.]+)(ms|s).*/\1/p" | tail -n10 | paste -sd+ | bc -l)

echo "$num / 10" | bc

