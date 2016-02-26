#!/bin/bash
umask 000
chown -R 797:797 /config
exec /sbin/setuser sickrage python /opt/sickrage/SickBeard.py --nolaunch --datadir=/config
