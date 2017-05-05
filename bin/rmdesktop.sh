#!/usr/bin/env bash

while true; do
    if [ -d "$HOME"/Desktop ]; then
        rmdir "$HOME"/Desktop;
    fi
    sleep 240;
done
