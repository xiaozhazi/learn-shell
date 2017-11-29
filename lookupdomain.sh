# !/bin/bash

# Does a 'whois domain-name' lookup on any of 3 alternate servers:
#            ripe.net, cw.net, radb.net

#Place this script -- renamed 'wh' -- in /usr/local/bin

#Requires symbolic links:
#ln -s /usr/local/bin/wh  /usr/local/bin/wh-ripe
#ln -s /usr/local/bin/wh /usr/local/bin/wh-apnic
#ln -s /usr/local/bin/wh /usr/local/bin/wh-tucows

E_NORAGS=75

if [ -z "$1" ]
then
  echo "Usage: `basename $0` [domain-name]"
  exit $E_
fi
