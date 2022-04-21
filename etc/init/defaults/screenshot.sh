#!/usr/bin/env bash

# スクリーンショットの保存先ディレクトリー
# 好みの場所に適宜変更してください
readonly SCREENSHOT_SAVE_DIR="$HOME/Pictures/ScreenShots"

# スクリーンショットの保存先ディレクトリーがない場合は作成する
mkdir -p "$SCREENSHOT_SAVE_DIR"

# スクリーンショットの保存先の変更
defaults write com.apple.screencapture location "$SCREENSHOT_SAVE_DIR"

# 設定を反映させる
killall SystemUIServer
