#!/usr/local/bin/fish

if grep -E "^/usr/local/bin/fish$" /etc/shells > /dev/null; then
  echo "'/usr/local/bin/fish' is already in /etc/shells"
else
  echo "'/usr/local/bin/fish' is not in /etc/shells"
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

# use "fish_config" command to set fish color skin
fish_config
