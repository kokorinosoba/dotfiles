#!/bin/bash

# Solarized Darkをデフォルトのテーマにする
defaults write com.apple.Terminal Default\ Window\ Settings -string "Solarized Dark"
defaults write com.apple.Terminal Startup\ Window\ Settings -string "Solarized Dark"


killall Terminal
open /System/Applications/Utilities/Terminal.app
