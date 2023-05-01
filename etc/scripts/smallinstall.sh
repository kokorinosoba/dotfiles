#!/usr/bin/env bash

set -eu

source "$(dirname $0)/../library/library.sh"

readonly DOTFILES_DIR="$(get_dotfiles_directory)"
readonly DOTFILES_BIN_DIR="$(get_dotfiles_bin_directory)"
readonly DOTFILES_SETUP_DIR="$(get_dotfiles_setup_directory)"

cd $DOTFILES_DIR

[[ -d $HOME/.config ]] && echo ".config directory exists" && exit 1

# install section
$DOTFILES_BIN_DIR/deploy
git submodule update --init .config/fish/functions/oh-my-fish
git submodule update --init .config/fish/functions/Bash2FishAliasesSync
$DOTFILES_SETUP_DIR/font-powerline.sh
$DOTFILES_DIR/etc/init/setup/oh-my-fish.sh
$DOTFILES_DIR/etc/init/setup/omf-packages.sh
