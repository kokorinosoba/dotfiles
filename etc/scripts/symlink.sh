#!/bin/bash

cd `dirname $0`
cd ../..
DOTFILES_DIR=$(pwd)

usage_exit() {
  echo "Usage: $0 [-d] [-f] [-i]" 1>&2
  exit 1
}

mklink() {
  local dotfile=$1
  if [[ -e "$HOME/$dotfile" ]]; then
    echo "Failed to create symlink to \$HOME/$dotfile"
  else
    ln -s $DOTFILES_DIR/$dotfile $HOME &&
    echo "Created symlink to \$HOME/$dotfile"
  fi
}

oplink() {
  local opt=$1
  local dotfile=$2
  ln -s $opt $DOTFILES_DIR/$dotfile $HOME &&
  [[ $opt = -f ]] && echo "Created symlink to \$HOME/$dotfile"
}

rmlink() {
  local dotfile=$1
  if [[ -e "$HOME/$dotfile" ]]; then
    unlink $HOME/$dotfile &&
    echo "Deleted symlink \$HOME/$dotfile"
  fi
}

FUNC="mklink"
while getopts fdih OPT
do
  case $OPT in
    d ) FUNC="rmlink" ;;
    f ) FUNC="oplink -f" ;;
    i ) FUNC="oplink -i" ;;
    h ) usage_exit ;;
    \? ) usage_exit ;;
  esac
done

shift $((OPTIND - 1))

for dotfile in .??*
do
  [[ "$dotfile" == ".git" ]] && continue
  [[ "$dotfile" == ".gitignore" ]] && continue
  [[ "$dotfile" == ".gitmodules" ]] && continue
  [[ "$dotfile" == ".DS_Store" ]] && continue

  $FUNC $dotfile
done
