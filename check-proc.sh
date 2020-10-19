#!/usr/bin/env bash

## echo `pgrep sshd | tr '\n' ' '` > /tmp/sshd.pid

case "$(pidof sshd | wc -w)" in

0)  echo "Restarting SSHD:"
    sudo /etc/init.d/sshd start
    ;;
1)  echo "SSHD is already up and running"
    ;;
esac
