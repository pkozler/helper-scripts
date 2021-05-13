#!/bin/bash

if [ $# -lt 1]
then
    echo 'Replace yourapp with your application!'
    exit
fi

sudo su
desktopfile=/usr/local/bin/$1.desktop

# Just create a file with the path to your application in /usr/local/bin/:

echo /opt/$1 > /usr/local/bin/$1

# Make it executable:

chmod +x /usr/local/bin/$1
