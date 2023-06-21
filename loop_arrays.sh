#!/bin/bash

# note the lack of commas
animals=("a dog" "a cat" "a fish")

for i in ${animals[*]}; do echo $i; done
for i in ${animals[@]}; do echo $i; done
for i in "${animals[*]}"; do echo $i; done

# this is the usual syntax that treats
# the array the way you'd expect
for i in "${animals[@]}";do echo $i; done

a[0]=foo
# get number of array elements
echo ${#a[@]}
# get length of array element 0
echo ${#a[0]}


foo=([2]=a [4]=b [6]=c)

# this prints out the values
for i in "${foo[@]}"; do echo $i; done

# this checks if the value in the array exists before doing anything with it
# this prints out hte index
for i in "${!foo[@]}"; do echo $i; done

# declare empty array
declare -a array
array+=(a d c b f t)
echo "original: ${array[@]}"

sorted_array=($(for i in "${array[@]}"; do echo $i; done | sort))
echo "Sorted array: ${sorted_array[@]}"

# delete single element
unset sorted_array[2]
echo "Sorted array: ${sorted_array[@]}"

# delete array
unset array
echo ${array[@]}


