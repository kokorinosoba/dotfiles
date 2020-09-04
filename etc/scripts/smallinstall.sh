#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(cd $(dirname $0); pwd | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BINDIR=$DOTDIR/bin
readonly SETUPDIR=$DOTDIR/etc/init/setup

cd $DOTDIR

[[ -d $HOME/.config ]] && echo ".config directory exists" && exit 1

# install section
$BINDIR/deploy
git submodule update --init .config/fish/functions/Fisher
git submodule update --init .config/fish/functions/Bash2FishAliasesSync
$SETUPDIR/font-powerline.sh
$DOTDIR/etc/init/setup/oh-my-fish.sh
$DOTDIR/etc/init/setup/omf-packages.sh
