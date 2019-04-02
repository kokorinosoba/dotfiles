# shell relogin alias
alias relogin="exec $SHELL -l"

# use trash instead of rm
alias trash="rmtrash"

# vim and nvim alias
alias vimo="/usr/bin/vim"
alias vim="nvim"

# git shortened alias
alias g="git"
alias ga="git add"
alias gb="git branch -a"
alias gbr="git browse-remote"
alias gc="git commit"
alias gcm="git commit --message"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gdc="git diff --cached"
alias gl="git log"
alias glo="git log --oneline"
alias glg="git log --oneline --graph"
alias gls="git log --stat"
alias glf="git ls-files"
alias glr="git ls-remote"
alias gs="git status --short --branch"
alias gst="git status"
alias gss="git status --short"
alias gsu="git submodule update"

# basic safe commands
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# fish like alias
alias ..="cd .."
alias la="ls -lha"
alias ll="ls -lh"

# make brew doctor wornings coming from using pyenv invisible
alias brew="env PATH=${PATH/\/Users\/Kokorin\/\.pyenv\/shims:/} brew"
