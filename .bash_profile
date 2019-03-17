### Column ###
# funny commands
# say, banner, sl, ncal, rig, yes, time cat, toilet, cowsay, cmatrix, fortune, lolcat, asciiquarium, nyancat
# ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'

# change display of prompt
PS1=" \W \[\033[35m\]$\[\033[0m\]"

# call .bashrc
if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# path to coreutils, findutils and gnu-sed
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

# XDG Base Directory Setting
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# path to pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv auto activation
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# path to ruby
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# path to dotfiles/bin
export PATH="$HOME/dotfiles/bin:$PATH"

# cask install option
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# display welcome message
figlet WELCOME TO BASH

# display todo list
todo
