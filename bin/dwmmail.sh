#!/usr/bin/env bash

fetchmail --check 2>/dev/null | while read line; do
    new=$(echo "$line" | sed 's/(//' | awk '{print $1-$3}')
    if [ "$new" != 0 ] && [ ! -e ~/.msg ]; then
        echo "New mail($new)" > ~/.msg
        echo "!!! !!! !!!" >> ~/.msg
        sleep 5
        if grep '^New mail' ~/.msg >/dev/null 2>/dev/null; then
            rm -f ~/.msg
        fi
    fi
done
