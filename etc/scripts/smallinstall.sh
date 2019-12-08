#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(cd $(dirname $0); pwd | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BINDIR=$DOTDIR/bin

cd $DOTDIR

# install section
$BINDIR/deploy -i
git submodule update --init .config/fish/functions/Fisher
git submodule update --init .config/fish/functions/Bash2FishAliasesSync
$DOTDIR/etc/init/setup/fisher-packages.sh
$DOTDIR/etc/init/setup/fisher-pyenv.sh
