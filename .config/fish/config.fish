# Todo List
# * Hit fish_config
# * Hit fish_update_completion

# remote current directory from PATH
for path in $PATH
  if [ $path = "." ];
    set -e PATH[(echo $PATH | tr " " "\n" | awk '$1 == "." {print NR}')]
  end
end

# call .aliasrc
make -C $HOME/.config/fish/functions/Bash2FishAliasesSync sync _B2F_BASHRC=$HOME/.aliasrc _B2F_ALIASES_FILE=$HOME/.config/fish/b2f_aliasrc.fish; and source $HOME/.config/fish/b2f_aliasrc.fish

# call .kokorc
if [ (whoami) = "Kokorin" ];
  make -C $HOME/.config/fish/functions/Bash2FishAliasesSync sync _B2F_BASHRC=$HOME/.kokorc _B2F_ALIASES_FILE=$HOME/.config/fish/b2f_kokorc.fish; and source $HOME/.config/fish/b2f_kokorc.fish
end

# path to coreutils, findutils and gnu-sed
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

set -x PATH /usr/local/opt/findutils/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/findutils/libexec/gnuman $MANPATH

set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/gnu-sed/libexec/gnuman $MANPATH

# path to tlmgr
set -x PATH /usr/local/texlive/2019/bin/x86_64-darwin $PATH

# path to dotfiles/bin
set -x PATH $HOME/dotfiles/bin $PATH

# XDG Base Directory Setting
# Use set -x (means "export") instead of export
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

# path to nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

# make less avarable for colordiff
set -x LESS -R

# alias for fish
alias relogin="exec /usr/local/bin/fish -l"

# display welcome message
type toilet > /dev/null 2>&1; and toilet -f future WELCOME TO FISH

# display todo list
type todo > /dev/null 2>&1; and todo ls --all
