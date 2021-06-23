#!/bin/sh

echo Starting sshd
/usr/sbin/sshd -E /var/log/auth.log &
touch /var/log/auth.log

echo Waiting for login...
while ! grep Accepted /var/log/auth.log >/dev/null; do
  sleep 1
done

SESSION_PID=$(ps -a | grep ohno | grep -o '[0123456789]*' | head -1)
echo "Connected! PID is $SESSION_PID. Deleting binaries..."

# Make a pipe because once we delete the binaries we won't be able to use sleep
mkfifo /sleep

rm -r /bin /dev /srv /sbin /usr /opt 2>/dev/null

echo "Good luck!"
while true; do
  read -t 1 <>/sleep
done

