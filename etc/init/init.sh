#!/usr/bin/env bash

set -u

readonly DOTDIR=$(cd $(dirname $0); pwd | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BINDIR=$DOTDIR/bin
readonly SETUPDIR=$DOTDIR/etc/init/setup

source $DOTDIR/etc/library/library.sh

ask_continue "deploying" && {
  $SETUPDIR/vscode.sh
  $SETUPDIR/iCloudDrive.sh
  $BINDIR/deploy -f
}

ask_continue "brew initializing" && {
  has brew || $SETUPDIR/homebrew.sh
  has brew && $SETUPDIR/brew-packages.sh
  has brew && $SETUPDIR/cask-packages.sh
}

ask_continue "shell initializing" && {
  $SETUPDIR/loginshells.sh
  $SETUPDIR/defaultshell.sh
}

ask_continue "atom initializing" && {
  has apm && apm stars --install
}

ask_continue "npm initializing" && {
  has npm && $SETUPDIR/npm-packages.sh
}

ask_continue "nvim initializing" && {
  has /usr/local/bin/pip3 && $SETUPDIR/nvim.sh
}

ask_continue "cpp initializing" && {
  $SETUPDIR/c++.sh
}

ask_continue "terminal initializing" && {
  $SETUPDIR/terminal-solarized.sh
  $SETUPDIR/iterm-japanesque.sh
  $SETUPDIR/font-powerline.sh
}

ask_continue "fish initializing" && {
  has fish && $SETUPDIR/fish.sh
  has fish && $SETUPDIR/oh-my-fish.sh
  has fish && $SETUPDIR/omf-packages.sh
}
