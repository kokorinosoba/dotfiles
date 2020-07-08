#!/usr/bin/env bash

mkdir -p "$HOME/Library/Application Support/Code"
ln -sfv "$HOME/dotfiles/.vscode/User" "$HOME/Library/Application Support/Code"
