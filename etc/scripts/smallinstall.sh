#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(realpath $0 | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BINDIR=$DOTDIR/bin

cd $DOTDIR

# install section
$BINDIR/symlink -i
git submodule update --init .config/fish/functions/Fisher
git submodule update --init .config/fish/functions/Bash2FishAliasesSync
$DOTDIR/etc/init/setup/fisher-packages.sh
$DOTDIR/etc/init/setup/fisher-pyenv.sh
