#!/usr/bin/env bash

default_shell="/usr/local/bin/bash"

if ! [[ $SHELL = $default_shell ]]; then
  chsh -s $default_shell
fi
