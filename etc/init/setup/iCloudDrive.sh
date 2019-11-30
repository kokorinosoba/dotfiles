#!/usr/bin/env bash

[[ -e $HOME/iCloudDrive ]] || {
  ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/iCloudDrive &&
  echo "Created symlink to \$HOME/iCloudDrive"
}
