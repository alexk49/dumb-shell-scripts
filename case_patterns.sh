#!/bin/bash

read -p "enter word: "

case "$REPLY" in
    [[:alpha:]])    echo "'$REPLY' is a single alphabetic character" ;;
    [[:alpha:]]\.*)    echo "'$REPLY' is a lots of alphabetic character" ;;
    [[:digit:]])   echo "'$REPLY' is a digit" ;;
    [ABC][0-9])     echo "'$REPLY' is A, B, or C followed by a digit" ;;
    ???)            echo "'$REPLY' is three characters long." ;;
    *.txt)          echo "'$REPLY' is a word ending in '*.txt*'" ;;
    *)              echo "'$REPLY' is something else" ;;
esac
