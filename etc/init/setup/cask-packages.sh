#!/usr/bin/env bash

# cask packages install script
packages=(
  android-file-transfer
  android-sdk
  android-studio
  appcleaner
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
  qlmarkdown
  rectangle
  rstudio
  shiftit
  slack
  unity-hub
  visual-studio-code
  wireshark
  zotero
)

brew install --cask ${packages[@]}
