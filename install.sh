#!/bin/bash

backup_dir="$HOME/dotfiles-old"

for file in *; do

  # target="$HOME/Remote/.$file"
  target="$HOME/.$file"

  if [[ $file != "install.sh" && $file != "README.md" && $file != "LICENSE" ]]; then
    if [ -e "$target" ]; then           # check if file exists
      if [ ! -L "$target" ]; then       # check if file is not a symlink.
        if [ ! -d "$backup_dir" ]; then # check if file backup_dir exists
          mkdir -p "$backup_dir" # create it if it does not
        fi
        echo -n "Backing up .$file to $backup_dir/$file ... "
        cp "$target" "$backup_dir/$file" # backup file if it exists
        echo "done"
      fi
      rm -rf "$target" # if it is a synlink then remove it
    fi
    echo -n "Linking .$file ... "
    ln -s "$PWD/$file" "$target"
    echo "done"
  fi

done

