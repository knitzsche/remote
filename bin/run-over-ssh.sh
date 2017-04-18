#!/bin/sh
USER=”remotemgr”
/usr/sbin/useradd --extrausers $USER
# We need a very secure and random password as nobody should ever able to guess
# it as its only meant for the internal use.
PASSWORD=”$(pwgen -y -n -c 32 1)”
echo $USER:$PASSWORD | /usr/sbin/chpasswd
export PATH_TO_SCRIPT=$SNAP_DATA/my-script.sh
/usr/sbin/sshpass -p ‘$PASSWORD’ ssh $USER@localhost $PATH_TO_SCRIPT &> /tmp/output.txt 
#sshpass -p ‘$PASSWORD’ ssh $USER@localhost $PATH_TO_SCRIPT &> $SNAP_DATA/output.txt 
#/snap/remote/x2/bin/run-over-ssh.sh: 9: /snap/remote/x2/bin/run-over-ssh.sh: cannot create /var/snap/remote/x2/output.txt: Permission denied

/usr/sbin/deluser $USER
