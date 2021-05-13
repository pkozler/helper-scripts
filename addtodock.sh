#!/bin/bash

if [ $# -lt 1]
then
    echo 'Replace yourapp with your application!'
    exit
fi

# Create a .desktop file in /usr/share/applications/:
sudo su
desktopfile=/usr/share/applications/$1.desktop

echo "Desktop file: $desktopfile"
touch $desktopfile

# Paste the following content:
echo "# !/usr/bin/env xdg-open" >> $desktopfile
echo "# ![Desktop Entry]" >> $desktopfile
echo "# !Version=1.0" >> $desktopfile
echo "# !Type=Application" >> $desktopfile
echo "# !Terminal=false" >> $desktopfile
echo "# !Exec=/opt/$1" >> $desktopfile
echo "# !Name=$1" >> $desktopfile
echo "# !Comment='"$1"'" >> $desktopfile
echo "# !Icon=/opt/$1.png" >> $desktopfile

# Make this file executable:
chmod +x $desktopfile
echo Log out and log in!
