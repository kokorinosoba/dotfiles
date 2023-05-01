#!/usr/bin/env bash

has() {
  type "$1" > /dev/null 2>&1
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
