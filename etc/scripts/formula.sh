#!/bin/bash

FORMULAE=(coreutils
          figlet
          findutils
          fish
          gcc
          ghostscript
          gibo
          git
          gnu-sed
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
