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

echo $SCRIPT_DIR
git submodule -i update
[[ -e $HOME/iCloudDrive ]] || bash icloud.sh
has brew || bash brew.sh
has brew && bash formula.sh
has brew && bash cask.sh
has npm && bash npm.sh
has /usr/local/bin/pip3 && bash nvim.sh

bash solarized.sh
bash powerline.sh

has fish && fish fish.sh
has fish && fish fisher.sh
