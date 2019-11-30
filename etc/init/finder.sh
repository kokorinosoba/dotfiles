#!/usr/bin/env bash

# 拡張子の表示
defaults write -globalDomain AppleShowAllExtensions -bool true
# 拡張子の非表示
# defaults delete -globalDomain AppleShowAllExtensions

# 検索実行時に「このMacを検索」にする
defaults write com.apple.finder FXDefaultSearchScope -string SCev


killall Finder
