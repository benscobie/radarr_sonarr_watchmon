#!/usr/bin/with-contenv sh

if [ -z "$CRON" ]; then
	echo "
Not running in cron mode
"
	exit 0
fi

# Set up the cron schedule.
echo "
Initializing cron

$CRON
"
crontab -d # Delete any existing crontab.
echo "$CRON python /radarr_sonarr_watchmon.py" >/tmp/crontab.tmp
crontab /tmp/crontab.tmp
rm /tmp/crontab.tmp
