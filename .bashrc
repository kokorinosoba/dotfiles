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
alias gaa='git add -A' # --all
alias gap='git add -p' # --patch
alias gau='git add -u' # --update

alias gb='git branch'     # make branch
alias gba='git branch -a' # include remote branch (--all)
alias gbr='git branch -r' # only remote branch (--remotes)
alias gbd='git branch -d' # delete merged branch (--delete)
alias gbD='git branch -D' # delete branch by force

alias gc='git commit -v' # show diff in commit message editor (--verbose)
alias 'gc!'='git commit -v --amend' # --verbose --amend
alias gca='git commit -v -a' # --verbose --all
alias 'gca!'='git commit -v -a --amend' # --verbose --all --amend
alias gcam='git commit -a -m' # --all --message
alias gcm='git commit -m' # --message
alias 'gcm!'='git commit --amend -m' # --amend --message
alias gcinit='git commit --allow-empty -m "initial commit"'

alias gco='git checkout'
alias gcob='git checkout -b' # make and checkout branch
alias gcoB='git checkout -B' # make and checkout branch by force
alias gcom='git checkout master'
alias gcod='git checkout develop'

alias gd='git diff'
alias gdst='git diff --stat'
alias gdc='git diff --cached'
alias gdstc='git diff --stat --cached'
alias gds='git diff --staged' # same meaning to (--cached)
alias gdsts='git diff --stat --staged'

alias gf='git fetch'
alias gfa='git fetch -a' # --all
alias gfap='git fetch -a -p' # --all --prune
alias gfp='git fetch -p' # --prune
alias gfo='git fetch origin' # gfo [master]: possible to choose fetching remote branch

alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph'
alias glgo='git log --graph --oneline'
alias gls='git log --stat'

alias glf='git ls-files'
alias glr='git ls-remote'

alias gm='git merge'
alias gma='git merge --abort'
alias gmom='git merge origin/master'

alias gpl='git pull'
alias gup='git pull -r' # --rebase
alias gupa='git pull -r --autostash' # --rebase --autostash
alias gupav='git pull -r --autostash -v' # --rebase  --autostash --verbose
alias gupv='git pull -r -v' # --rebase --verbose

alias gp='git push'
alias gpf='git push --force-with-lease' # possible to push when the local is the newest
alias 'gpf!'='git push -f' # --force
alias gpv='git push -v' # --verbose
alias gpu='git push -u' # --set-upstream
alias gpsup='git push -u' # same as above

alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'

alias gs='git status'
alias gss='git status -s' # --short
alias gssb='git status -s -b' # --short --branch

alias gst='git stash push'
alias gsta='git stash apply'
alias gstall='git stash -a' # stash include untracked and ignore files (--all)
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

# shortened alias
alias md='mkdir'
alias rd='rmdir'

# shortcut to dotfiles
alias dotfiles='cd $HOME/dotfiles'

# for PS1 setting
alias cps='source cps'

# make brew doctor wornings coming from using pyenv invisible
alias brew="env PATH=${PATH/\/Users\/Kokorin\/\.pyenv\/shims:/} brew"

# For Competitive Programming
alias red='source red'
alias rla='source roll 1'
alias rlb='source roll 2'
alias rlc='source roll 3'
alias rld='source roll 4'
alias mkcd='source mkcd'
