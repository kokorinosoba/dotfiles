#!/bin/bash

set -eu

DOTDIR=$(readlink -f $0 | sed -e 's/\(.*dotfiles\).*/\1/')
BIN_DIR=$DOTDIR/bin
SCRIPT_DIR=$DOTDIR/etc/scripts
cd $SCRIPT_DIR

has() {
  type $1 > /dev/null 2>&1
}

echo "Continue initializing? [Y/n]"
read ANSWER

case $ANSWER in
  "Y" | "y" | "yes" | "Yes" | "YES" );;
  * )
    echo "Canceled."
    exit 1;;
esac

git submodule update --init --depth=1
./icloud.sh
$BIN_DIR/symlink
has brew || ./brew.sh
has brew && ./formula.sh
has brew && ./cask.sh
./shells.sh
./bash.sh
has apm && apm stars --install
has npm && ./npm.sh
has pyenv && ./pyenv.bash
has /usr/local/bin/pip3 && ./nvim.sh
has gcc-8 && ./c++.sh

./solarized.sh
./japanesque.sh
./powerline.sh

has fish && ./fish.sh
has fish && ./fisher.sh
has fisher && ./fisherPyenvInit.sh
