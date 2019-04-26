#!/bin/bash

TMPDIR=${TMPDIR%/}
sed -e 's/if status --is-login//' -e '15,20 s/end//' -e '15,20 s/ *\(set -x.*\)/\1/' $HOME/.config/fish/conf.d/pyenv.fish > $TMPDIR/pyenv.fish
cat $TMPDIR/pyenv.fish > $HOME/.config/fish/conf.d/pyenv.fish
