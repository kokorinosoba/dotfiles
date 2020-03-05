#!/usr/bin/env bash

# cask packages install script
packages=(appcleaner
          atom
          cheatsheet
          chromedriver
          coteditor
          docker
          google-chrome
          google-japanese-ime
          iterm2
          kindle
          macdown
          processing
          qlmarkdown
          shiftit
          slack
          texshop
          visual-studio
          visual-studio-code
          wireshark
          zotero)

brew cask install ${packages[@]}
