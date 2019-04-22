#!/bin/bash

if grep -E "^/usr/local/bin/zsh$" /etc/shells > /dev/null; then
  echo "'/usr/local/bin/zsh' is already in /etc/shells"
else
  echo "'/usr/local/bin/zsh' is not in /etc/shells"
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi
