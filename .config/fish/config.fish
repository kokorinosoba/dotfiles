# Done List
# * Change Prompt
# * Install fisherman
# * Install pyenv rbenv using fisher
# * Change $HOME/.config/fisherman/pyenv/conf.d/pyenv.fish
#   >>> remove if status --is-login & end
# * Install Bash2FishAliasesSync
# * Install bobthefish
# * Install powerline fonts
# * Install Doracula Theme into iTerm
# * Hit fish_update_completion

make -C $HOME/.config/fish/functions/Bash2FishAliasesSync sync; and source $HOME/.config/fish/b2f_aliases.fish

# path to coreutils, findutils and gnu-sed
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

set -x PATH /usr/local/opt/findutils/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/findutils/libexec/gnuman $MANPATH

set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/gnu-sed/libexec/gnuman $MANPATH

# path to dotfiles/bin
set -x PATH $HOME/dotfiles/bin $PATH

# XDG Base Directory Setting
# Use set -x (means "export") instead of export
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

# make less avarable for colordiff
set -x LESS -R

# alias for fish
alias relogin="exec /usr/local/bin/fish -l"

# display welcome message
toilet -f future WELCOME TO FISH

# display todo list
todo ls --all
