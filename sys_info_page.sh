#!/bin/bash

# this has been made as following along with
# william shotts linux command line book

# program to output a system information page

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
    cat <<- _EOF_
<h2>Home Space Utilization</h2>
<pre>$(du -sh /home/*)</pre>
_EOF_
    return
    }


# this is set as a here switch
# normally follows convention of:
# command << token
# text
# token
# where command is name of command
# token is a string used to indicate the end of the embedded text
cat <<- _EOF_
<html>
<head>
<title>$TITLE</title>
</head>
<body>
<h1>$TITLE</h1>
<p>$TIMESTAMP</p>
$(report_uptime)
$(report_disk_space)
$(report_home_space)
</body>
</html>
_EOF_
