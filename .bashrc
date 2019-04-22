### alias xx='' or alias xx=""
# ダブルクウォートだと起動時に変数展開される
# Variables are expanded at shell startup when using a double quote
# シングルクウォートだと呼び出し時に変数展開される
# Variables are expanded at the time of alias call when using single quart

# shell relogin alias
alias relogin='exec $SHELL -l'

# use trash instead of rm
alias trash='rmtrash'

# vim and nvim alias
alias vimo='/usr/bin/vim'
alias vim='nvim'

# python alias to use python3 instead of python2
alias python='python3'

# git shortened alias
alias g='git'
alias ga='git add'
alias gb='git branch -a'
alias gbr='git browse-remote'
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit --message'
alias gcam='git commit --amend --message'
alias gci='git commit --allow-empty -m "initial commit"'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph'
alias glgo='git log --graph --oneline'
alias gls='git log --stat'
alias glf='git ls-files'
alias glr='git ls-remote'
alias gpl='git pull'
alias gp='git push'
alias gs='git status'
alias gss='git status --short'
alias gssb='git status --short --branch'
alias gsu='git submodule update'

# basic safe commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# fish like alias
alias ..='cd ..'
alias ls='ls --color=auto --classify'
alias la='ls -lha'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias df='df -h'

# shortcut to dotfiles
alias dotfiles='cd $HOME/dotfiles'

# make brew doctor wornings coming from using pyenv invisible
alias brew="env PATH=${PATH/\/Users\/Kokorin\/\.pyenv\/shims:/} brew"

# For Competitive Programming
alias cd-='. cd-'
alias rla='. roll 1'
alias rlb='. roll 2'
alias rlc='. roll 3'
alias rld='. roll 4'
