#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(realpath $0 | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BINDIR=$DOTDIR/bin

$BINDIR/symlink -d
cd $DOTDIR/..
rm -rf $DOTDIR
git clone --recurse-submodules https://github.com/kokorinosoba/dotfiles.git
$BINDIR/symlink -f
$DOTDIR/etc/init/setup/fisher-packages.sh
$DOTDIR/etc/init/setup/fisher-pyenv.sh
