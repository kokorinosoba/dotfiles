function has
  type "$argv[1]" > /dev/null 2>&1
end

function get_homebrew_prefix
  if has /usr/local/bin/brew
    echo "/usr/local"
  else if has /opt/homebrew/bin/brew
    echo "/opt/homebrew"
  end
end

function get_homebrew_executable
  echo (get_homebrew_prefix)/bin/brew
end
