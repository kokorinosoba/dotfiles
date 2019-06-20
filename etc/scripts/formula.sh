#!/bin/bash

FORMULAE=(bash
          colordiff
          coreutils
          emacs
          figlet
          findutils
          fish
          gcc
          ghostscript
          gibo
          git
          gnu-sed
          id3v2
          mono
          neovim
          nkf
          npm
          pyenv
          pyenv-virtualenv
          python
          rbenv
          rmtrash
          toilet
          tree
          wget
          zsh)

brew install ${FORMULAE[@]}
