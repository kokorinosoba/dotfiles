#!/bin/bash

set -eu

cd `dirname $0`
cd ../scripts
SCRIPT_DIR=$(pwd)

has() {
  type "$1" > /dev/null 2>&1
}

echo "Continue initializing? [Y/n]"
read ANSWER

case $ANSWER in
  "" | "Y" | "y" | "yes" | "Yes" | "YES" );;
  * )
    echo "Canceled."
    exit 1;;
esac

git submodule update --init
bash symlink.sh

[[ -e $HOME/iCloudDrive ]] || bash icloud.sh
has brew || bash brew.sh
has brew && bash formula.sh
has brew && bash cask.sh
bash shells.sh
bash bash.sh
has apm && apm stars --install
has npm && bash npm.sh
has pyenv && bash pyenv.bash
has /usr/local/bin/pip3 && bash nvim.sh
has gcc-8 && bash c++.bash

bash solarized.sh
bash japanesque.sh
bash powerline.sh

has fish && fish fish.sh
has fish && fish fisher.sh
has fisher && bash fisherPyenvInit.sh
