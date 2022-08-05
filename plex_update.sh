#!/bin/bash
PLEX_TOKEN="XXXXXXXXXXXXXXXX"
cd /tmp/
wget -O plex.deb  "https://plex.tv/downloads/latest/5?channel=8&build=linux-x86_64&distro=debian&X-Plex-Token=$PLEX_TOKEN" --quiet
downloaded_version=$(dpkg -I plex.deb | grep 'Version:' | cut -d ":" -f 2 | cut -c 2-)
current_version=$(dpkg -s plexmediaserver | grep '^Version:' | cut -d ":" -f 2 | cut -c 2-)
if [ "$downloaded_version" != "$current_version" ]
then
echo "$(date)"
dpkg -i plex.deb
fi
rm plex.deb
