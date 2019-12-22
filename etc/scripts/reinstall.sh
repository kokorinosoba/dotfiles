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

recurse=false

while getopts r opt &> /dev/null
do
  case $opt in
    # r option - --recurse-submodules
    r ) recurse=true ;;
    \? ) echo "unknown option recognized" 1>&2 ; exit 1 ;;
  esac
done

shift $((OPTIND - 1))


# uninstall section
$BINDIR/deploy -d
cd $DOTDIR/..
rm -rf $DOTDIR

# install section
if $recurse; then
  git clone --recurse-submodules https://github.com/kokorinosoba/dotfiles.git
else
  git clone https://github.com/kokorinosoba/dotfiles.git
  cd $DOTDIR ; git submodule update --init .config ; cd $DOTDIR/..
fi
$BINDIR/deploy -f
$DOTDIR/etc/init/setup/fisher-packages.sh
$DOTDIR/etc/init/setup/fisher-pyenv.sh
cd $DOTDIR ; git config commit.template .commit_template
