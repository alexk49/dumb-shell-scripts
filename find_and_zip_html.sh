#!/bin/bash

# find type files, with *.html in name
# take output with pipe and xargs
# output.zip given as output filename
find . -type f -name "*.html" | xargs zip output.zip
