#!/bin/bash

cd `dirname $0`
cd ../..
DOTFILES_DIR=$(pwd)

for dotfile in .??*
do
  [[ "$dotfile" == ".git" ]] && continue
  [[ "$dotfile" == ".gitignore" ]] && continue
  [[ "$dotfile" == ".gitmodules" ]] && continue
  [[ "$dotfile" == ".DS_Store" ]] && continue

  if [[ -e "$HOME/$dotfile" ]]; then
    echo "Could not create symlink to \$HOME/$dotfile"
  else
    ln -s $DOTFILES_DIR/$dotfile $HOME &&
    echo "Created symlink to \$HOME/$dotfile"
  fi
done
