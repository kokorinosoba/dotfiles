#!/bin/bash

# install powerline font
# set "Liberation Mono for Powerline font" to iterm2 app after installing
# iTerm2 > Preferences > Profiles > Text > Font > Change Font
git clone https://github.com/powerline/fonts.git $TMPDIR/Powerline &&
$TMPDIR/Powerline/install.sh
