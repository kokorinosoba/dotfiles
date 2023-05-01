#!/usr/bin/env bash

has() {
  type "$1" > /dev/null 2>&1
}

get_homebrew_prefix() {
  if has /usr/local/bin/brew; then
    echo "/usr/local"
  elif has /opt/homebrew/bin/brew; then
    echo "/opt/homebrew"
  fi
}

get_homebrew_executable() {
  echo "$(get_homebrew_prefix)/bin/brew"
}

ask_continue() {
  local answer
  read -p "Continue $1? [Y/n]: " answer

  case "$answer" in
    "Y" | "y" | "yes" | "Yes" | "YES" ) ;;
    * )
      echo "Canceled."
      return 1 ;;
  esac
}

is_darwin() {
  [[ "$(uname)" ==  "Darwin" ]]
}

is_linux() {
  [[ "$(uname)" ==  "Linux" ]]
}
