#!/usr/bin/env bash

checkium_color() {
    if [[ $? -eq 0 ]]; then
        echo -ne "\033[0;32m"
        return 0
    else
        echo -ne "\033[0;31m"
        return 1
    fi
}

checkium_check() {
    if [[ $? -eq 0 ]]; then
        local char="✓"
    else
        local char="✗ "
    fi
    echo $char
}

checkium_face() {
    if [[ $? -eq 0 ]]; then
        local face=":)"
    else
        local face=":("
    fi
    echo $face
}

checkium_random_face() {
    if [[ $? -eq 0 ]]; then
        local faces=(":)" ":D")
    else
        local faces=(":P" ":(" ":(" ":O" ":\\" ":|" ":(" ":(")
    fi

    local facels=${#faces[*]}
    local randfacels=${faces[$(($RANDOM % $facels))]}
    echo $randfacels

}

