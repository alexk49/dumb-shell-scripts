#!/bin/bash

# script to activate venv for booksanon
# and run flask server in debug mode
cd ~/repos/booksanon
source venv/bin/activate
export FLASK_DEBUG=1
flask run
