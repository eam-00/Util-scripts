#!/usr/bin/env bash

## 

apt-get install logwatch 

rsync {} remote-server:/tmp/

mkdir -p /var/cache/logwatch
cp /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf.ORIG

cp /etc/logrotate.conf /etc/logrotate.conf.ORIG
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ORIG

cd /tmp/

cp logrotate.conf /etc/logrotate.conf
cp sshd_config /etc/ssh/sshd_config
cp logwatch.conf /etc/logwatch/conf/logwatch.conf

## EoF ##
