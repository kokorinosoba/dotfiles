#!/usr/bin/env bash

# brew packages install script
packages=(bash
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
          gnu-sed
          id3v2
          imagemagick
          mono
          neovim
          nkf
          nodebrew
          npm
          postgresql
          pyenv
          pyenv-virtualenv
          python
          rbenv
          rmtrash
          toilet
          tree
          wget
          zsh)

brew install ${packages[@]}
