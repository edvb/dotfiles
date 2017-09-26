#!/usr/bin/env bash

while true; do
	status=""
	if [ -r ~/.dwm.msg ]; then
		while read line; do
			status+=" $line"
			xsetroot -name "$(echo -e "$status")"
			sleep 1
		done < ~/.dwm.msg
	else
		song=$(basename "$(cmus-remote -Q | grep file | cut -d ' ' -f 2-)" .mp3)
		ramused=$(free -m  | grep Mem | awk '{print $3}')
		ramtotal=$(free -m | grep Mem | awk '{print $2}')
		cpuperc=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
		temp=$(curl -s wttr.in | head -4 | tail -1 | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | rev | sed -e 's/^[ \t]*//' | cut -d " " -f 1,2 | rev | tr -d " ")

		if [[ $(cmus-remote -Q | grep status) == "status playing" ]]; then
			status+="$song"
		fi
		status+="$cpuperc"
		status+="$(echo "$ramused"*100/"$ramtotal" | bc)%"
		status+="$temp"
		status+="$(date +"%b %d %I:%M")"

		xsetroot -name "$(echo -e "$status")"
		sleep 1
	fi
done

