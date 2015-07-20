#!/bin/bash

backup_dir="$HOME/dotfiles-old"

for file in *; do

  # target="$HOME/remote/.$file"
  target="$HOME/.$file"

  if [[ $file != "install.sh" && $file != "README.md" && $file != "LICENSE" &&
        $file != "config" ]]; then
    if [ -e "$target" ]; then           # check if file exists
      if [ ! -L "$target" ]; then       # check if file is not a symlink.
        if [ ! -d "$backup_dir" ]; then # check if file backup_dir exists
          mkdir -p "$backup_dir" # create it if it does not
        fi
        echo -n "Backing up .$file to $backup_dir/$file ... "
        cp "$target" "$backup_dir/$file" # backup file if it exists and is not a symlink
        echo "done"
      fi
      rm -rf "$target" # if it is a symlink then remove it
    fi
    echo -n "Linking .$file ... "
    ln -s "$PWD/$file" "$target"
    echo "done"
  fi

done

