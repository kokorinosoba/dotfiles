#!/bin/bash

# set solarized color scheme to terminal
TMPDIR=${TMPDIR%/}
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git $TMPDIR/Solarized &&
open $TMPDIR/Solarized/Solarized\ Dark.terminal
