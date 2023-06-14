#!/bin/bash

# case menu

# case word in 
#       [pattern p| pattern]...) commands ;;]...
# esac

clear
echo "
Please Select:

1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit
"

read -p "Enter selection [0-3]: "

# the ) in the below is terminating the given pattern
# wildcards and regex are accepted as given patterns
# the last *) matches anything else
# this script wants very specific 0-3 given in reply so everything else is rejected
case "$REPLY" in
    0)      echo "Program terminated."
            exit
            ;;
    1)      echo "Hostname: '$HOSTNAME'"
            uptime
            ;;
    2)      df -h
            ;;
    3)      if [[ "$(id -u)" -eq 0 ]]; then
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
