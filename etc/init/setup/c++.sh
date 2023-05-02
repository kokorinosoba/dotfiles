#!/usr/bin/env bash

source "$(dirname $0)/../../library/library.sh"

readonly HOMEBREW_BIN_DIR="$(get_homebrew_bin_directory)"
readonly COMPILER_VERSION=12

# settings required when including bits/stdc++.h
if ! has "$HOMEBREW_BIN_DIR/gcc-$COMPILER_VERSION"; then
  echo "$HOMEBREW_BIN_DIR/gcc-$COMPILER_VERSION does not exist."
  exit 1
fi

ln --symbolic --force "$HOMEBREW_BIN_DIR/gcc-$COMPILER_VERSION" "$HOMEBREW_BIN_DIR/gcc"
ln --symbolic --force "$HOMEBREW_BIN_DIR/g++-$COMPILER_VERSION" "$HOMEBREW_BIN_DIR/g++"
