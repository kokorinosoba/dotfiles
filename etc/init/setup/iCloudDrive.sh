#!/usr/bin/env bash

if ! [[ -e $HOME/iCloudDrive ]]; then
  ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/iCloudDrive &&
  echo 'Created symlink to $HOME/iCloudDrive'
fi
