# Todo List
# * Hit fish_config
# * Hit fish_update_completion

# timezone setting
set -g theme_date_timezone Asia/Tokyo

# call .aliasrc
make -C $HOME/.config/fish/functions/Bash2FishAliasesSync sync _B2F_BASHRC=$HOME/.aliasrc _B2F_ALIASES_FILE=$HOME/.config/fish/b2f_aliasrc.fish; and source $HOME/.config/fish/b2f_aliasrc.fish

# call .kokorc
if [ (whoami) = "Kokorin" ];
  make -C $HOME/.config/fish/functions/Bash2FishAliasesSync sync _B2F_BASHRC=$HOME/.kokorc _B2F_ALIASES_FILE=$HOME/.config/fish/b2f_kokorc.fish; and source $HOME/.config/fish/b2f_kokorc.fish
end

# call .taiharc
if [ (whoami) = "taihara" -o (whoami) = "Aihara" ];
  make -C $HOME/.config/fish/functions/Bash2FishAliasesSync sync _B2F_BASHRC=$HOME/.taiharc _B2F_ALIASES_FILE=$HOME/.config/fish/b2f_taiharc.fish; and source $HOME/.config/fish/b2f_taiharc.fish
end

# path to /usr/local/bin
set -x PATH /usr/local/bin $PATH

# path to homebrew sbin
set -x PATH /usr/local/sbin $PATH

# path to coreutils, findutils and gnu-sed
if [ -d /usr/local/opt/coreutils/libexec/gnubin ];
  set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
end

if [ -d /usr/local/opt/findutils/libexec/gnubin ];
  set -x PATH /usr/local/opt/findutils/libexec/gnubin $PATH
  set -x MANPATH /usr/local/opt/findutils/libexec/gnuman $MANPATH
end

if [ -d /usr/local/opt/gnu-sed/libexec/gnubin ];
  set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
  set -x MANPATH /usr/local/opt/gnu-sed/libexec/gnuman $MANPATH
end

# path to Xcode developer dir
set -x DEVELOPER_DIR /Applications/Xcode.app/Contents/Developer


# pipenv virtualenv location
set -x PIPENV_VENV_IN_PROJECT true
set -x PIPENV_IGNORE_VIRTUALENVS true

# path to tlmgr
if [ -d /usr/local/texlive/2019/bin/x86_64-darwin ];
  set -x PATH /usr/local/texlive/2019/bin/x86_64-darwin $PATH
end

# path to dotfiles/bin
set -x PATH $HOME/dotfiles/bin $PATH

# XDG Base Directory Setting
# Use set -x (means "export") instead of export
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

# path to nodebrew
if [ -d $HOME/.nodebrew/current/bin ];
  set -x PATH $HOME/.nodebrew/current/bin $PATH
end

# path to android sdk
set -x PATH $HOME/Library/Android/sdk/platform-tools $PATH

# make less avarable for colordiff
set -x LESS -R

# alias for fish
alias relogin='exec /usr/local/bin/fish -l'

# abbreviation for cd to last directory
abbr --add --global - 'cd -'

# display welcome message
if type toilet &> /dev/null;
  toilet -f future WELCOME TO FISH
else if type figlet &> /dev/null;
  figlet -f smslant WELCOME TO FISH
end

# display todo list
type todo &> /dev/null; and todo ls --all
