#!/usr/bin/env bash

case "$(pidof sshd | wc -w)" in

0)  echo "Restarting SSHD:"
    sudo /etc/init.d/sshd start
    ;;
1)  echo "SSHD is already up and running"
    ;;
esac
