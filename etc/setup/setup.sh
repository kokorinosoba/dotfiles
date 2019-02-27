#!/bin/bash

set -eu

cd `dirname $0`
cd ../..
DOTFILES_DIR=$(pwd)

echo "Continue creating symlink? [Y/n]"
read ANSWER

case $ANSWER in
  "" | "Y" | "y" | "yes" | "Yes" | "YES" );;
  * )
    echo "Canceled."
    exit 1;;
esac

for dotfile in .??*
do
  [[ "$dotfile" == ".git" ]] && continue
  [[ "$dotfile" == ".gitignore" ]] && continue
  [[ "$dotfile" == ".gitmodules" ]] && continue
  [[ "$dotfile" == ".DS_Store" ]] && continue

  if [[ -e "$HOME/$dotfile" ]]; then
    echo "Could not create symlink to $dotfile"
  else
    ln -s $DOTFILES_DIR/$dotfile $HOME &&
    echo "Created symlink to \$HOME/$dotfile"
  fi
done
