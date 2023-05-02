#!/usr/bin/env bash

source "$(dirname $0)/../../library/library.sh"

default_shell="$(get_homebrew_bin_directory)/bash"

if ! [[ "$SHELL" = "$default_shell" ]]; then
  chsh -s "$default_shell"
fi
