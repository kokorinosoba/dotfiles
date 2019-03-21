#!/bin/bash

FORMULAE=(coreutils
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
          npm
          pyenv
          pyenv-virtualenv
          python
          rbenv
          rmtrash
          toilet
          tree)

brew install ${FORMULAE[@]}
