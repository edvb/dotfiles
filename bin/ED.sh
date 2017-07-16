#!/usr/bin/env bash

# ED: change between $EDITORs
#
# To install add `source path/to/ED.sh` to your shell's rc file

ED() {
	local EDITOR_new
	if [[ $EDITOR == "vim" ]]; then
		EDITOR_new="emacs"
	elif [[ $EDITOR == "emacs" ]]; then
		EDITOR_new="vim"
	fi

	echo "Setting EDITOR to $EDITOR_new"
	EDITOR=$EDITOR_new
}

