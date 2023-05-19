#!/usr/bin/env bash

has() {
  type "$1" > /dev/null 2>&1
}

get_homebrew_prefix() {
  if has /usr/local/bin/brew; then
    echo "/usr/local"
  elif has /opt/homebrew/bin/brew; then
    echo "/opt/homebrew"
  fi
}

get_homebrew_bin_directory() {
  echo "$(get_homebrew_prefix)/bin"
}

get_homebrew_executable() {
  echo "$(get_homebrew_prefix)/bin/brew"
}

__get_dotfiles_directory() {
  echo "$(cd "$(dirname "$0")" || exit 1 ; pwd | sed -e 's/\(.*dotfiles\).*/\1/')"
}

__get_dotfiles_bin_directory() {
  echo "$(__get_dotfiles_directory)/bin"
}

__get_dotfiles_setup_directory() {
  echo "$(__get_dotfiles_directory)/etc/init/setup"
}

# 下記のような関数でDORFILES関連のパスの定数をexportする方法も検討したが、
# 自動的にexportされることで挙動が不安定になる可能性を考慮して、個々の関数として定義することにした。
# export_dotfiles_directories() {
#   export DOTFILES_DIR="$(__get_dotfiles_directory)"
#   export DOTFILES_BIN_DIR="$(__get_dotfiles_directory)/bin"
#   export DOTFILES_SETUP_DIR="$(__get_dotfiles_directory)/etc/init/setup"
# }

ask_continue() {
  local answer
  read -p "Continue $1? [Y/n]: " -r answer

  case "$answer" in
    "Y" | "y" | "yes" | "Yes" | "YES" ) ;;
    * )
      echo "Canceled."
      return 1 ;;
  esac
}

is_darwin() {
  [[ "$(uname)" ==  "Darwin" ]]
}

is_linux() {
  [[ "$(uname)" ==  "Linux" ]]
}
