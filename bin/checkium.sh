#!/usr/bin/env bash

checkium_color() {
    # set color depending on if the last command succeed or not
    if [[ $? -eq 0 ]]; then
        echo -ne "\033[0;32m"
        return 0
    else
        echo -ne "\033[0;31m"
        # need to return a value so that the other functions here will
        # know if last command ran OK or not, the previous code will return 0
        return 1
    fi
}

checkium_color_simple() {
    if [[ $? -eq 0 ]]; then
        return 0
    else
        echo -ne "\033[0;31m"
        return 1
    fi
}

checkium_custom() {
    if [[ $? -eq 0 ]]; then
        local char=$1
    else
        local char=$2
    fi
    echo $char
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
    # set arrays for different faces to randomly choose from
    if [[ $? -eq 0 ]]; then
        local faces=(":)" ":D")
    else
        local faces=(":P" ":(" ":(" ":O" ":\\" ":|" ":(" ":(")
    fi

    local facels=${#faces[*]} # get how many elements are in each array
    local randfacels=${faces[$((RANDOM % facels))]} # randomly choose an array element
    echo $randfacels # print that face

}

