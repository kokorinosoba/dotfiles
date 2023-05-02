#!/usr/bin/env bash

set -eu

source "$(dirname $0)/../library/library.sh"

readonly DOTFILES_DIR="$(__get_dotfiles_directory)"
readonly DOTFILES_BIN_DIR="$(__get_dotfiles_bin_directory)"
readonly DOTFILES_SETUP_DIR="$(__get_dotfiles_setup_directory)"

cd $DOTFILES_DIR

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
$DOTFILES_BIN_DIR/deploy -d
cd $DOTFILES_DIR/..
rm -rf $DOTFILES_DIR

# install section
git clone https://github.com/kokorinosoba/dotfiles.git
cd $DOTFILES_DIR

if $recurse; then
  git submodule update --init --recursive
else
  git submodule update --init .config
fi

$DOTFILES_BIN_DIR/deploy -f
$DOTFILES_SETUP_DIR/oh-my-fish.sh
$DOTFILES_SETUP_DIR/omf-packages.sh
git config commit.template .commit_template
