#!/bin/sh

## get-caba-temperature.sh

cd /tmp/
/usr/bin/ftp -o - https://x.com/smn_ocba > caba_temp
/usr/bin/grep -oE -m 1 'Temperatura.{0,7}' caba_temp | /usr/bin/head -1 | /usr/bin/cut -c 13-18

# EOF #
