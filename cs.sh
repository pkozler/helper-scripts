#!/bin/bash

gc_int_back=$(( ( $(date +%s) - $(date --date='200930' +%s) ) / (60*60*24) ))
gc_web_root="/var/www/$(whoami).tmp123.cz/web"
gc_setup_dir="/var/home/$(whoami)/temp"
gc_output_log=".git-count.log"
gc_locker_file=".~git-count.lock"
gc_current_pwd="$(pwd -LP)"

(rm -rf "$gc_setup_dir" && mkdir --parents "$gc_setup_dir" && cd "$gc_setup_dir")

if [ -f "$gc_locker_file" ]
then (echo "Locked!" && exit 1)
else (echo "Locking..." && touch "$gc_locker_file" && rm -rf "git-count" && git clone "git@github.com:moskytw/git-count.git" && rm -f "$gc_locker_file") # &> "$gc_output_log"
fi

while [ -f "$gc_locker_file" ]
do (echo "..." && sleep 1)
done

(echo "Unlocked." && cd "git-count" && python "setup.py" install --user && cd "$gc_web_root" && python -m gitcount --period="daily" --first="mon" --author="pkozler.email@gmail.com" --number="$gc_int_back" && cd "$gc_current_pwd")
