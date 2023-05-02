#!/usr/bin/env bash

source "$(dirname $0)/../../library/library.sh"
readonly PIP_EXECUTABLE="$(get_homebrew_bin_directory)/pip3"

if ! has "$PIP_EXECUTABLE"; then
  echo "$PIP_EXECUTABLE does not exist."
  exit 1
fi

$PIP_EXECUTABLE install flake8 neovim
