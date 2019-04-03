#!/bin/bash

if grep -E "^/usr/local/bin/bash$" /etc/shells > /dev/null; then
  echo "'/usr/local/bin/bash' is already in /etc/shells"
else
  echo "'/usr/local/bin/bash' is not in /etc/shells"
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
fi

[[ $SHELL = "/usr/local/bin/bash" ]] || chsh -s /usr/local/bin/bash
