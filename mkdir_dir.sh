#/bin/bash

# example script to mkdir dirs

# the commented out command would make a dir called temp
# and if successful would then change dir to the newly made dir
# mkdir temp && cd temp

# this first tests for the existence of a dir called temp
# the || only runs if a test returns false
# meaning the below will make a dir if the dir does not already exist
[[ -d temp ]] || mkdir temp
