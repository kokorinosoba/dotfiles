#!/bin/bash

source $HOME/dotfiles/__bobthefish_glyphs.sh
set -x

function __bobthefish_basename() {
  echo ${1##*/}
}

function __bobthefish_dirname() {
  echo ${1%/*}
}

function __bobthefish_git_branch() {
  local ref
  ref=$(git symbolic-ref HEAD 2>/dev/null) && {
    [ "$theme_display_git_master_branch" != 'yes' -a "$ref" = 'refs/heads/master' ] &&
    # echo $branch_glyph &&
    return 0

    local truncname=$ref
    [ "$theme_use_abbreviated_branch_name" = 'yes' ]
    return 0
  }
}

__bobthefish_git_branch
