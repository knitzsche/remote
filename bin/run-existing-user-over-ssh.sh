#!/bin/sh
USER="knitzsche"
PASSWORD="ubuntu"
echo "===== USER: $USER"
echo "===== PWRD: $PASSWORD"
export PATH_TO_SCRIPT=$SNAP_DATA/my-script.sh
$SNAP/usr/bin/sshpass -p $PASSWORD ssh $USER@localhost $PATH_TO_SCRIPT 
