#!/usr/bin/env bash

set -eu

readonly DOTDIR=$(cd $(dirname $0); pwd | sed -e 's/\(.*dotfiles\).*/\1/')
readonly BINDIR=$DOTDIR/bin

cd $DOTDIR

if ! git diff --no-ext-diff --quiet ||
   ! git diff --no-ext-diff --cached --quiet ||
   git rev-parse --verify --quiet refs/stash >/dev/null ||
   git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' >/dev/null 2>&1
then
  echo "dotfiles cannot be reinstalled due to have changes"
  exit 1
fi

# uninstall section
$BINDIR/symlink -d
cd $DOTDIR/..
rm -rf $DOTDIR

# install section
git clone --recurse-submodules https://github.com/kokorinosoba/dotfiles.git
$BINDIR/symlink -f
$DOTDIR/etc/init/setup/fisher-packages.sh
$DOTDIR/etc/init/setup/fisher-pyenv.sh
