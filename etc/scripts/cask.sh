#!/bin/bash

CASKS=(appcleaner
       atom
       cheatsheet
       chromedriver
       coteditor
       google-chrome
       google-japanese-ime
       iterm2
       macdown
       processing
       qlmarkdown
       shiftit
       slack
       texshop
       visual-studio-code
       wireshark
       zotero)

brew cask install ${CASKS[@]}
