#!/usr/bin/env bash

# ED: change between $EDITORs
#
# toggles your $EDITOR between your different editors.
# To install add `source path/to/ED.sh` to your shell's rc file.

ED() {
	local new
	if [[ "$1" != "" ]]; then
		new="$1"
	elif [[ $EDITOR == "vim" ]]; then
		new="emacs"
	else
		new="vim"
	fi

	echo "Setting \$EDITOR to $new"
	EDITOR=$new
}
