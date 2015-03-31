#!/bin/bash

CRONTAB="/etc/crontab"

echo "SHELL=/bin/sh" > $CRONTAB
echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> $CRONTAB
echo >> $CRONTAB
echo "$CRON_FREQUENCY darmon curator --host es delete --older-than $OLDER_THAN" >> $CRONTAB
echo >> $CRONTAB

if [ "$1" = "cron" ]
then
    exec cron -f
else
    exec "$@"
fi
