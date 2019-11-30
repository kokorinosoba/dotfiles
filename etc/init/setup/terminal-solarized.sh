#!/usr/bin/env bash

# install solarized color scheme to default terminal
readonly TMPDIR=${TMPDIR%/}
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git $TMPDIR/Solarized &&
open $TMPDIR/Solarized/Solarized\ Dark.terminal
