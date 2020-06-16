#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(cd $(dirname $0); pwd | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BINDIR=$DOTDIR/bin
readonly SETUPDIR=$DOTDIR/etc/init/setup

source $DOTDIR/etc/library/lib.sh

ask_continue deploying

$SETUPDIR/iCloudDrive.sh
$SETUPDIR/vscode.sh
$BINDIR/deploy -f

ask_continue initializing

has brew || $SETUPDIR/homebrew.sh
has brew && $SETUPDIR/brew-packages.sh
has brew && $SETUPDIR/cask-packages.sh

$SETUPDIR/loginshells.sh
$SETUPDIR/defaultshell.sh

has apm && apm stars --install
has npm && $SETUPDIR/npm-packages.sh
has pyenv && $SETUPDIR/pyenv.sh
has /usr/local/bin/pip3 && $SETUPDIR/nvim.sh
has gcc-8 && $SETUPDIR/c++.sh

$SETUPDIR/terminal-solarized.sh
$SETUPDIR/iterm-japanesque.sh
$SETUPDIR/font-powerline.sh

has fish && $SETUPDIR/fish.sh
has fish && $SETUPDIR/fisher-packages.sh
has fisher && $SETUPDIR/fisher-pyenv.sh
