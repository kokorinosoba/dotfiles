#!/usr/bin/env bash

# install japanesque color scheme to iTerm
# set Japanesque scheme to iterm2 app after installing
# iTerm2 > Preferences > Profiles > Colors > Color Presets > Japanesque
readonly TMPDIR=${TMPDIR%/}
git clone https://github.com/aereal/dotfiles.git $TMPDIR/Japanesque &&
open $TMPDIR/Japanesque/colors/Japanesque/Japanesque.itermcolors
