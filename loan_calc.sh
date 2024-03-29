#!/bin/bash

# loan calc - calculate monthly loan payments

PROGNAME="${0##*/}" # use parameter expansion to get basename

usage () {
cat <<- EOF
Usage: $PROGNAME PRINCIPAL INTEREST MONTHS

Where:

PRINCIPAL is the amount of the loan
INTEREST is the APR as a numebr (7% = 0.07).
MONTHS is the length of the loan's term.

EOF
}

if (($# !=3)); then
    usage
    exit 1
fi

for arg in "$@"; do
    # pattern covers digits as well as floating point
    pattern="^-?[[:digit:]]+\.?[[:digit:]]+$"
    if [[ ! "$1" =~ $pattern ]]; then 
        echo "All values should be digits"
        echo "Invalid digit"
        usage
        exit 1
    fi
done

principal=$1
interest=$2
months=$3

bc <<- EOF
scale = 10
i = $interest / 12
p = $principal
n = $months
a = p * ((i * ((1+ i) ^ n)) / (((1 + i) ^ n) - 1))
print a, "\n"
EOF
