### alias xx='' or alias xx=""
# ダブルクウォートだと起動時に変数展開される
# Variables are expanded at shell startup when using a double quote
# シングルクウォートだと呼び出し時に変数展開される
# Variables are expanded at the time of alias call when using single quart

# shell relogin alias
alias relogin='exec $SHELL -l'

# external command aliases
[[ -x `which rmtrash` ]] && alias trash='rmtrash' # use trash instead of rm
[[ -x `which nvim` ]] && alias vim='nvim' && alias vi='nvim'
[[ -x `which colordiff` ]] && alias diff='colordiff -u' || alias diff='diff -u'

# python alias to use python3 instead of python2
alias python='python3'

# git shortened alias
alias g='git'

alias ga='git add'
alias ga.='git add .'
alias gaa='git add --all'
alias gap='git add --patch'
alias gau='git add --update'

alias gb='git branch'
alias gba='git branch --all' # include remote branch
alias gbr='git branch --remotes'
alias gbd='git branch --delete' # delete merged branch
alias gbD='git branch -D' # delete branch by force

alias gc='git commit --verbose' # show diff in commit message editor
alias 'gc!'='git commit --verbose --amend'
alias gca='git commit --verbose --all'
alias 'gca!'='git commit --verbose --all --amend'
alias gcam='git commit --all -message'
alias gcm='git commit --message'
alias 'gcm!'='git commit --amend --message'
alias gcinit='git commit --allow-empty -m "initial commit"'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'

alias gd='git diff'
alias gds='git diff --staged'
alias gdc='git diff --cached'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph'
alias glgo='git log --graph --oneline'
alias gls='git log --stat'

alias glf='git ls-files'
alias glr='git ls-remote'

alias gpl='git pull'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias 'gpf!'='git push --force'

alias gs='git status'
alias gss='git status --short'
alias gssb='git status --short --branch'

alias gst='git stash push'
alias gsta='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstpi='git stash pop --index'
alias gsts='git stash show --text'

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
alias red='. red'
alias rla='. roll 1'
alias rlb='. roll 2'
alias rlc='. roll 3'
alias rld='. roll 4'
