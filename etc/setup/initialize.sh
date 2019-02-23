#!/bin/bash
# ATTENTION
# Please install iTerm2 before this shell script's execution

set -eux

has() {
  type "$1" > /dev/null 2>&1
}

ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/iCloudDrive
has brew || brew.sh && formula.sh && cask.sh

# set solarized color scheme to terminal
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git $TMPDIR/Solarized
open $TMPDIR/Solarized/Solarized\ Dark.terminal

# fish setting
mkdir -p $XDG_CONFIG_HOME/fish/functions
cp -i src/config.fish $XDG_CONFIG_HOME/fish
cp -i src/fisher.fish $XDG_CONFIG_HOME/fish/functions
# curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
git clone https://github.com/powerline/fonts.git $TMPDIR/Powerline
$TMPDIR/Powerline/install.sh

# not working below command on shell script, please execute manually
# 3.x.x fisher add fisherman/pyenv fisherman/rbenv oh-my-fish/theme-bobthefish
# 2.x.x fisher pyenv rbenv omf/theme-bobthefish
# use below command yourself to set fish color skin
# fish_config

# git ignore setting
mkdir -p $XDG_CONFIG_HOME/git
cp -i src/ignore $XDG_CONFIG_HOME/git

# neovim setting
cp -i src/.vimrc $HOME
mkdir -p $HOME/.vim/colors
cp -i src/dein.toml $HOME/.vim
cp -i src/dein_lazy.toml $HOME/.vim
cp -i src/hybrid.vim $HOME/.vim/colors
cp -i src/tender.vim $HOME/.vim/colors
ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
ln -s $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
pip3 install neovim
