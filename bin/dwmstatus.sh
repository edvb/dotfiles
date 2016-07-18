#!/usr/bin/env bash

while true; do
	status=""
	if [ -r ~/.msg ]; then
		while read line; do
			status+=" $line"
			xsetroot -name "$(echo -e "$status")"
			sleep 1
		done < ~/.msg
	else
		# batperc=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "percentage" | cut -c26-27)
		# batstate=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "state" | awk '{print $2}')
		ramused=$(free -m  | grep Mem | awk '{print $3}')
		ramtotal=$(free -m | grep Mem | awk '{print $2}')
		# soundperc=$(amixer get Master | tail -n1 | awk '{ print $5 }' | tr -d []%)

		# if [[ $soundperc -le 10 ]]; then
		# 	status+=""
		# elif [[ $soundperc -le 33 ]]; then
		# 	status+=""
		# elif [[ $soundperc -le 66 ]]; then
		# 	status+=""
		# else
		# 	status+=""
		# fi

		status+="$(echo "$ramused"*100/"$ramtotal" | bc)%"

		# if [[ $(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "native-path" | awk '{print $2}') != "(null)" ]]; then
		# 	if [[ $batstate = "charging" ]]; then
		# 		if [[ $batperc -eq 99 ]]; then
		# 			status+=""
		# 		else
		# 			status+=""
		# 		fi
		# 	elif [[ $batperc -le 10 ]]; then
		# 		status+=""
		# 	elif [[ $batperc -le 25 ]]; then
		# 		status+=""
		# 	elif [[ $batperc -le 50 ]]; then
		# 		status+=""
		# 	else
		# 		status+=""
		# 	fi
		# 	status+="$batperc%"
		# fi

		status+="$(date +"%b %d %I:%M")"

		xsetroot -name "$(echo -e "$status")"
		sleep 1
	fi
done

