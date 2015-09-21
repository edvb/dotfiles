#!/usr/bin/env bash

# ED: Rotate between EDITORs
ED() {
	local EDITOR_new
	if [[ $EDITOR == "vim" ]]; then
		EDITOR_new="emacs"
	elif [[ $EDITOR == "emacs" ]]; then
		EDITOR_new="vim"
	fi

	echo "Setting EDITOR to $EDITOR_new"
	EDITOR=$EDITOR_new
	echo "EDITOR is now $EDITOR"
}

