### Column ###
# funny commands
# say, banner, sl, ncal, rig, yes, time cat, toilet, cowsay, cmatrix, fortune, lolcat, asciiquarium, nyancat
# ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'

# change display of prompt
# PS1=" \W \[\033[35m\]$\[\033[0m\]"

# PROMPT_COMMANDで指定するfunction
function __command_rprompt() {
  # 右プロンプトに表示させる内容。今回はタイムスタンプ。
  local rprompt=$(date "+%Y/%m/%d %H:%M:%S")

  # 右プロンプトを表示するために必要となる幅
  local num=$(($COLUMNS - ${#rprompt} - 2))

  # 右プロンプトの表示(\rがないとうまく動作しないので注意)
  printf "%${num}s$rprompt\r" ''
}
PROMPT_COMMAND=__command_rprompt

# substitute for bash-it
[[ -f $HOME/.git-completion.bash ]] &&  source $HOME/.git-completion.bash
[[ -f $HOME/.git-prompt.sh ]] && source $HOME/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '
PS1="\[\033[1;32m\]\$(date +%Y/%m/%d_%H:%M:%S)\[\033[0m\] \[\033[33m\]\H:\w\n\[\033[0m\][\u@ \W]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\$ "

# call .bashrc
[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc

# enable autocd
[[ $BASH_VERSINFO -ge 4 ]] && shopt -s autocd

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

# make less avarable for colordiff
export LESS='-R'

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
[[ -n $BASH ]] && figlet -f smslant WELCOME TO BASH

# display todo list
todo ls --all
