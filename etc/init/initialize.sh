#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(realpath $0 | sed -e 's/\(.*dotfiles\).*/\1/')
BINDIR=$DOTDIR/bin
SCRIPTDIR=$DOTDIR/etc/scripts
cd $SCRIPTDIR

has() {
  type $1 > /dev/null 2>&1
}

echo "Continue initializing? [Y/n]"
read ANSWER

case $ANSWER in
  "Y" | "y" | "yes" | "Yes" | "YES" ) ;;
  * )
    echo "Canceled."
    exit 1 ;;
esac

# git submodule update --init --depth=1
$SCRIPTDIR/icloud.sh
$BINDIR/symlink
has brew || $SCRIPTDIR/homebrew.sh
has brew && $SCRIPTDIR/brew-packages.sh
has brew && $SCRIPTDIR/cask-packages.sh

$SCRIPTDIR/loginshells.sh
$SCRIPTDIR/defaultshell.sh

has apm && apm stars --install
has npm && $SCRIPTDIR/npm-packages.sh
has pyenv && $SCRIPTDIR/pyenv.sh
has /usr/local/bin/pip3 && $SCRIPTDIR/nvim.sh
has gcc-8 && $SCRIPTDIR/c++.sh

$SCRIPTDIR/terminal-solarized.sh
$SCRIPTDIR/iterm-japanesque.sh
$SCRIPTDIR/font-powerline.sh

has fish && $SCRIPTDIR/fish.sh
has fish && $SCRIPTDIR/fisher-packages.sh
has fisher && $SCRIPTDIR/fisher-pyenv.sh
