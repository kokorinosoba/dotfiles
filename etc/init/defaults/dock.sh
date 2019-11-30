#!/usr/bin/env bash

# Dockの位置を左側にする
defaults write com.apple.dock orientation -string left

# 最近使ったアプリケーションを非表示
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock recent-apps "()"

# Dockのサイズを64にする
defaults write com.apple.dock tilesize -int 64


killall Dock
