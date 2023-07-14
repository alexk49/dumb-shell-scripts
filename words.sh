#!/bin/bash

# from data wrangling mit missing semester course

#Find the number of words (in /usr/share/dict/words) that contain at least three as and don’t have a 's ending. What are the three most common last two letters of those words? sed’s y command, or the tr program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

# get most common two letter combinations
# uniq wouldn't work without being passed sort first
grep ".*[a].*[a].*[a].*[^s]$" words | sed -nre "s/^(.*)([a-zA-Z]{2})$/\2/p" | sort | uniq -c | sort -n

# most common letters are: an

# 76 combinations 
grep ".*[a].*[a].*[a].*[^s]$" words | sed -nre "s/^(.*)([a-zA-Z]{2})$/\2/p" | sort | uniq | wc -l
#76
