#!/usr/bin/env bash

set -u

source "$(dirname $0)/../library/library.sh"

readonly DOTFILES_BIN_DIR="$(__get_dotfiles_bin_directory)"
readonly DOTFILES_SETUP_DIR="$(__get_dotfiles_setup_directory)"

ask_continue "deploying" && {
  $DOTFILES_SETUP_DIR/vscode.sh
  $DOTFILES_SETUP_DIR/iCloudDrive.sh
  $DOTFILES_BIN_DIR/deploy -f
}

ask_continue "brew initializing" && {
  has brew || $DOTFILES_SETUP_DIR/homebrew.sh
  has brew && $DOTFILES_SETUP_DIR/brew-packages.sh
  has brew && $DOTFILES_SETUP_DIR/cask-packages.sh
}

ask_continue "shell initializing" && {
  $DOTFILES_SETUP_DIR/loginshells.sh
  $DOTFILES_SETUP_DIR/defaultshell.sh
}

ask_continue "atom initializing" && {
  has apm && apm stars --install
}

ask_continue "npm initializing" && {
  has npm && $DOTFILES_SETUP_DIR/npm-packages.sh
}

ask_continue "nvim initializing" && {
  has /usr/local/bin/pip3 && $DOTFILES_SETUP_DIR/nvim.sh
}

ask_continue "cpp initializing" && {
  $DOTFILES_SETUP_DIR/c++.sh
}

ask_continue "terminal initializing" && {
  $DOTFILES_SETUP_DIR/terminal-solarized.sh
  $DOTFILES_SETUP_DIR/iterm-japanesque.sh
  $DOTFILES_SETUP_DIR/font-powerline.sh
}

ask_continue "fish initializing" && {
  has fish && $DOTFILES_SETUP_DIR/fish.sh
  has fish && $DOTFILES_SETUP_DIR/oh-my-fish.sh
  has fish && $DOTFILES_SETUP_DIR/omf-packages.sh
}
