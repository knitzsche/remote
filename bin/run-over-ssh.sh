#!/bin/bash
USER=remotemgr
$SNAP/usr/sbin/useradd --extrausers $USER
# We need a very secure and random password as nobody should ever able to guess
# it as its only meant for the internal use.
PASSWORD=$(pwgen -y -n -c 32 1)
echo $USER:$PASSWORD | $SNAP/usr/sbin/chpasswd
export PATH_TO_SCRIPT=$SNAP_DATA/my-script.sh
#$SNAP/usr/bin/sshpass -p $PASSWORD ssh -F $SNAP/config $USER@localhost $PATH_TO_SCRIPT 
echo -e "#\x21/bin/sh\necho $PASSWORD" >/tmp/askpass.sh
sshpass -p "$PASSWORD" ssh -F $SNAP/config $USER@localhost "$PATH_TO_SCRIPT $PASSWORD"
#/snap/remote/x2/bin/run-over-ssh.sh: 9: /snap/remote/x2/bin/run-over-ssh.sh: cannot create /var/snap/remote/x2/output.txt: Permission denied

$SNAP/usr/sbin/deluser $USER
