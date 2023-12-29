#!/usr/bin/env bash

# brew packages install script
packages=(
  bash
  colordiff
  coreutils
  emacs
  figlet
  findutils
  fish
  gcc
  ghc
  ghostscript
  gibo
  git
  git-lfs
  gnu-sed
  id3v2
  imagemagick
  mdbook
  mono
  neovim
  nkf
  npm
  pipenv
  poetry
  python
  r
  rbenv
  trash-cli
  tree
  wget
  xmlstarlet
  zsh
)

brew install ${packages[@]}
