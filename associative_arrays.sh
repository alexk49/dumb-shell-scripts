#!/bin/bash

# bash 4.0 supports associative arrays
# this allows you to set strings as the reference index

declare -A colors

colors["red"]="#ff0000"
colors["green"]="#00ff00"
colors["blue"]="#0000ff"

for i in "${!colors[@]}"; do echo $i; done

echo ${colors[@]}
echo ${colors[@]}
echo ${colors["blue"]}
