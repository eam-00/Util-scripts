#!/usr/bin/env bash

## echo `pgrep sshd | tr '\n' ' '` > /tmp/sshd.pid
## case "$(pidof sshd | wc -w)" in
PROC='sshd'

case "$(pgrep $PROC | wc -w)" in

0)  echo "Warning: $PROC is not running"
    exit 1
    ;;
1)  echo "Great: $PROC is running Ok"
    exit 0
    ;;
esac

## EoF ##