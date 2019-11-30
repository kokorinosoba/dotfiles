#!/usr/bin/env bash

has() {
  type "$1" > /dev/null 2>&1
}

addshell() {
  local shell_name=$1
  if grep -E "^/usr/local/bin/$shell_name$" /etc/shells > /dev/null; then
    echo "'/usr/local/bin/$shell_name' is already in /etc/shells"
  else
    echo "'/usr/local/bin/$shell_name' is not in /etc/shells"
    echo "/usr/local/bin/$shell_name" | sudo tee -a /etc/shells
  fi
}

for shell_name in bash zsh fish
do
  has /usr/local/bin/$shell_name || continue
  addshell $shell_name
done
