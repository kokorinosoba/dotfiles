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

# path to coreutil symbolic link
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# XDG Base Directory Setting
# Use set -x (means "export") instead of export
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

# alias for fish
alias relogin="exec /usr/local/bin/fish -l"

# display welcome message
toilet -f future WELCOME TO FISH

# display todo list
todo
