#!/usr/bin/env bash

has() {
  type $1 > /dev/null 2>&1
}

ask_continue() {
  local answer
  read -p "Continue $1? [Y/n]: " answer

  case $answer in
    "Y" | "y" | "yes" | "Yes" | "YES" ) ;;
    * )
      echo "Canceled."
      exit 1 ;;
  esac
}
