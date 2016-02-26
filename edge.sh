#!/bin/sh
if [ -z "$EDGE" ]; then
	echo "Bleeding edge not requested"
else
	exec /sbin/setuser sickrage git -C /opt/sickrage checkout master
	exec /sbin/setuser sickrage git -C /opt/sickrage pull
fi
