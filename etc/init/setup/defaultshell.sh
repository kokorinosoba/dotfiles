#!/usr/bin/env bash

default_shell="/usr/local/bin/bash"
[[ $SHELL = $default_shell ]] || chsh -s $default_shell
