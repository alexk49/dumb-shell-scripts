#!/bin/bash

# add a variable to a string
a="foo"
echo "${a}_file"

# set default values / substitute values if nothing set
example=
echo ${example:-"substitute value if unset"}
# will return blank
echo $example

foo="bar"
# as value has been set
# this will print bar
echo ${foo:-"substitute value if unset"}

# another way of setting default values
foo=
echo ${foo:="default value if unset"}
foo="bar"
echo ${foo:-"substitute value if unset"}

# set a substitute value if value is set
foo=
echo ${foo:+"substitute value if set"}
foo="bar"
echo ${foo:+"substitute value if set"}

# expansion that returns variable names
# this lists all environment names that begin with BASH
echo ${!BASH*}
echo 
echo ${!BASH*}

echo

# string operations
foo="this string is long"
# count string length
echo "'$foo' is ${#foo} characters long."

# get particular values of strings
# or string offsets
# start at character 5 and take rest of string
echo ${foo:5}
# take small section of string
echo ${foo:5:6}

# work by negative offset
# this goes from end of string
echo ${foo: -5}
echo ${foo: -5:2}

# expand string by wildcard patterns
foo="file.txt.zip"
# removes shortest match
echo ${foo#*.}
# removes longest match
echo ${foo##*.}

# remove from the end of the string
echo ${foo%.*}
echo ${foo%%.*}

# find and replace operation on contents of string
# replace first occurence
# ${parameter/pattern/string}
# replace all occurences
# ${parameter//pattern/string}
# the match must occur at beginning of string
# ${parameter/#pattern/string}
# the match must occur at the end
# ${parameter/%pattern/string}
# you can emit the /string part which will just delete the pattern
foo=JPG.JPG

echo ${foo/JPG/jpg}
echo ${foo//JPG/jpg}
echo ${foo/#JPG/jpg}
echo ${foo/%JPG/jpg}

# create exit code if value unset:
foo=
echo ${foo:?"parameter is empty"}
