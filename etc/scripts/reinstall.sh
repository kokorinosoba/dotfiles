#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(realpath $0 | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BIN_DIR=$DOTDIR/bin

$BIN_DIR/symlink -d
cd $DOTDIR/..
rm -rf $DOTDIR
git clone --recurse-submodules https://github.com/kokorinosoba/dotfiles.git
$BIN_DIR/symlink -f
$DOTDIR/etc/scripts/fisher.sh
$DOTDIR/etc/scripts/fisherPyenvInit.sh
