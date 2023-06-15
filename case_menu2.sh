#!/bin/bash

# case menu with letters

clear
echo "
Please Select:

A. Display System Information
B. Display disk space
C. Display Home space utilization
Q. Quit
"

read -p "Enter selection [A, B, C or Q] > "

case "$REPLY" in 
    q|Q)    echo "Program terminated."
            exit
            ;;
    a|A)    echo "Hostname: $HOSTNAME"
            uptime
            ;;
    b|B)    df -h
            ;;
    c|C)    if [[ "$(id -u)" -eq 0 ]]; then
                echo "Home Space Utilization (All Users)"
                du -sh /home/*
            else
                echo "Home Space Utilization ($USER)"
                du -sh "$HOME"
            fi
            ;;
    *)      echo "Invalid entry" >&2
            exit 1
            ;;
esac
