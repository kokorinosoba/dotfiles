#!/bin/bash

set -eu

cd `dirname $0`
cd ../..

exists() {
  type "$1" > /dev/null 2>&1
}

for dotfile in .??*
do
  [[ "$dotfile" == ".git" ]] && continue
  [[ "$dotfile" == ".gitignore" ]] && continue
  [[ "$dotfile" == ".gitmodules" ]] && continue
  [[ "$dotfile" == ".DS_Store" ]] && continue

  [[ -e "$HOME/$dotfile" ]] || echo "create symlink to \$HOME/$dotfile" && ln -s $dotfile $HOME
done
