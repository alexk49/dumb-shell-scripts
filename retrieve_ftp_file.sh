#!/bin/bash

# script to retrieve a file via FTP
# example taken from William Shott Linux Command Line Book

FTP_SERVER=ftp.nl.debian.org
FTP_PATH=/debian/dists/strech/main/installer-amd64/current/images/cdrom
REMOTE_FILE=debian-cd_info.tar.gz

# these are seperated via here switch
# this allows the ftp commands to be run
# seperately within the opening of the ftp session
ftp -n << _EOF_
open $FTP_SERVER
user anonymous 
cd $FTP_PATH
hash
get $REMOTE_FILE
bye
_EOF_
ls -l "$REMOTE_FILE"
