#!/bin/bash

# this has been made as following along with
# william shotts linux command line book

# program to output a system information page

PROGNAME="$(basename "$0")"

# set global variable
# $HOSTNAME is the network name of the machine
TITLE="System Information Report For $HOSTNAME"

# set current time
# note the use of ( ) after the $
CURRENT_TIME="$(date +"%x %r %Z")"
# $USER is another system globabl variable
TIMESTAMP="Generated $CURRENT_TIME, by $USER"


report_uptime () {
    cat <<- _EOF_
<h2>System Uptime</h2>
<pre>$(uptime)>/pre>
_EOF_
    return
}


report_disk_space () {
    cat <<- _EOF_
<h2>Disk Space Utilization</h2>
<pre>$(df -h)</pre>
_EOF_
    return
 }


report_home_space () {
    # the super user's ID is always 0
    # so if super user then show all users
    if [[ "$(id -u)" -eq 0 ]]; then
    cat <<- _EOF_
<h2>Home Space Utilization (All Users)</h2>
<pre>$(du -sh /home/*)</pre>
_EOF_
    else
        # just show current users info
    cat <<- _EOF_
<h2>Home Space utilization ($USER)</h2>
<pre>$(du -sh $HOME)</pre>
_EOF_
    fi
    return
}


usage () {
    echo "$PROGNAME: usage: $PROGNAME [ -f file | -i ]"
    return
}

# this is set as a here switch
# normally follows convention of:
# command << token
# text
# token
# where command is name of command
# token is a string used to indicate the end of the embedded text
# there are issues with <<- and white space
# hence the lack of indentation
write_html_page () {
    cat <<- _EOF_
<html>
<head>
<title>$TITLE</title>
</head>
<body>
<h1>$TITLE<\h1>
<p>$TIMESTAMPE</p>
$(report_uptime)
$(report_disk_space)
$(report_home_space)
</body>
</html>
_EOF_
return
}

# process command line options

interactive=
filename=

# loop continues whilst $1 is not empty
while [[ -n "$1" ]]; do
    case "$1" in
        -f | --file)    shift
                        filename="$1"
                        ;;
        -i | --interactive) interactive=1
                            ;;
        -h | --help)        usage
                            exit
                            ;;
        *)                  usage >&2
                            exit 1
                            ;;
    esac
    shift
done

# set interactive mode

if [[ -n "$interactive" ]]; then
    while true; do
        read -p "Enter name of output file: " filename
        if [[ -e "$filename" ]]; then
            read -p "$filename' exists. Overwrite [y/n/q] > "
            case "$REPLY" in
                Y|y)    break
                        ;;
                Q|q)    echo "Program terminated"
                        exit
                        ;;
                *)      continue
                        ;;
            esac
        elif [[ -z "$filename" ]]; then
            continue
        else
            break
        fi
    done
fi


# output html page

if [[ -n "$filename" ]]; then
    if touch "$filename" && [[ -f "$filename" ]]; then
        write_html_page > "$filename"
    else
        echo "$PROGNAME: cannot write file '$filename'" >&2
        exit 1
    fi
else
    write_html_page
fi
