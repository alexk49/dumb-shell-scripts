#!/bin/bash

# script to make basic layout of flask files/dirs
mkdir static
mkdir templates
touch app.py
touch requirements.txt
touch templates/index.html
touch templates/layout.html
touch static/styles.css
echo "flask" | tee requirements.txt
