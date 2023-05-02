#!/usr/bin/env bash

source "$(dirname $0)/../../library/library.sh"

readonly HOMEBREW_BIN_DIR="$(get_homebrew_bin_directory)"

addshell() {
  local shell_name="$1"
  if grep -E "^$HOMEBREW_BIN_DIR/$shell_name$" /etc/shells > /dev/null; then
    echo "'$HOMEBREW_BIN_DIR/$shell_name' is already in /etc/shells"
  else
    echo "'$HOMEBREW_BIN_DIR/$shell_name' is not in /etc/shells"
    echo "$HOMEBREW_BIN_DIR/$shell_name" | sudo tee -a /etc/shells
  fi
}

for shell_name in bash zsh fish
do
  has "$HOMEBREW_BIN_DIR/$shell_name" || continue
  addshell "$shell_name"
done
