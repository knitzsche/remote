#!/bin/bash
USER="knitzsche"
PASSWORD="ubuntu"
echo "===== 1"
echo "===== USER: $USER"
echo "===== PWRD: $PASSWORD"
echo -e "#\x21/bin/sh\necho $PASSWORD" >/tmp/askpass.sh
export PATH_TO_SCRIPT=$SNAP_DATA/my-script.sh
ssh -o "PasswordAuthentication=yes" -F $SNAP/config $USER@localhost "$PATH_TO_SCRIPT $PASSWORD"
#$SNAP/usr/bin/sshpass -p $PASSWORD ssh -F $SNAP/config $USER@localhost $PATH_TO_SCRIPT 
echo "===== DONE"
