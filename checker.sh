#!/bin/bash

#source random_num.sh

#echo $?

count=0

output_file="logs/log.txt"

while [[ $? == 0 ]]; do
    ((++count))
    # the 2>&1 redirects both standard out and standard error
    # messages to the file
    # source random_num.sh >> $output_file 2>&1
    # Another way to redirect stderr to stdout is to use the &> construct
    # in Bash &> has the same meaning as 2>&1:
    random_num.sh &>> $output_file
done

echo $?
echo "After $count runs random_num failed" >> $output_file
