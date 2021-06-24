#!/bin/sh

# Start sshd
/usr/sbin/sshd -E /var/log/auth.log &
touch /var/log/auth.log

# Make a pipe because once we delete the binaries we won't be able to use sleep
mkfifo /.simulator/sleep

while true; do
  read -t 1 <>/.simulator/sleep
done

