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
alias pip='pip3'

# git shortened alias
alias ga='git add'
alias ga.='git add .'
alias gaa='git add -A' # --all
alias gap='git add -p' # --patch
alias gau='git add -u' # --update
alias gav='git add -v' # --verbose

alias gb='git branch'     # make branch
alias gba='git branch -a' # include remote branch (--all)
alias gbd='git branch -d' # delete merged branch (--delete)
alias gbD='git branch -D' # delete branch by force
alias gbr='git branch -r' # only remote branch (--remotes)
alias gbv='git branch -v' # show branches commits' SHA-1 (-vv, --verbose)
alias gbnm='git branch --no-merged'
alias gbuup='git branch --unset-upstream'
alias gbsup='git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref @)'

alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gbl='git blame -b -w' # show boundary commits' SHA-1 (-b) and white space (-w)

alias gc='git commit -v' # show diff in commit message editor (--verbose)
alias 'gc!'='git commit -v --amend'     # --verbose --amend
alias gca='git commit -v -a'            # --verbose --all: auto add midified files
alias 'gca!'='git commit -v -a --amend' # --verbose --all --amend
alias gcm='git commit -m'               # --message
alias 'gcm!'='git commit --amend -m'    # --amend --message
alias gcam='git commit -a -m'           # --all --message
alias gcinit='git commit --allow-empty -m "initial commit"'

alias gcf='git config --list' # show config

alias gcl='git clone'
alias gclr='git clone --recurse-submodules'

alias gclean='git clean -id' # include directories + (--interactive)
alias gpristine='git reset --hard && git clean -dfx' # pristine=fresh?

alias gco='git checkout'
alias gcob='git checkout -b' # make and checkout branch
alias gcoB='git checkout -B' # make and checkout branch by force
alias gcom='git checkout master'
alias gcod='git checkout develop'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdst='git diff --stat'
alias gdc='git diff --cached'
alias gdcst='git diff --cached --stat'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged' # same meaning to (--cached)
alias gdsst='git diff --staged --stat'
alias gdsw='git diff --staged --word-diff'
alias gdt='git diff-tree --no-commit-id --name-only -r' # show modified files
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfa='git fetch -a'     # --all
alias gfap='git fetch -a -p' # --all --prune
alias gfp='git fetch -p'     # --prune
alias gfo='git fetch origin' # gfo <branch>: possible to choose fetching remote branch

alias gg='git gui citool'
alias 'gg!'='git gui citool --amend'

alias gi='git init'

alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph'
alias glgo='git log --graph --oneline'
alias gls='git log --stat'
alias glS='git log -S' # differences log search with string 'slS "string" file'
alias glG='git log -G' # differences log search with regexp 'slG "regexp" file'

alias glf='git ls-files'
alias glfv='git ls-files -v'

alias glr='git ls-remote'
alias glrgu='git ls-remote --get-url'
alias glrh='git ls-remote --heads'
alias glrr='git ls-remote --refs'
alias glrt='git ls-remote --tags'

alias gm='git merge'
alias gma='git merge --abort'
alias gmom='git merge origin/master'
alias gmum='git merge upstream/master'

alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'

alias gmv='git mv'

alias gpl='git pull'
alias gplup='git pull origin $(git rev-parse --abbrev-ref @)'
alias gplr='git pull -r'                  # --rebase
alias gplrv='git pull -r -v'              # --rebase --verbose
alias gplras='git pull -r --autostash'     # --rebase --autostash
alias gplrasv='git pull -r --autostash -v' # --rebase --autostash --verbose
alias gplt='git pull --tags'

alias gp='git push'
alias gpd='git push -n'                 # --dry-run
alias gpf='git push --force-with-lease' # possible to push when the local is the newest
alias 'gpf!'='git push -f'              # --force
alias gpv='git push -v'                 # --verbose
# alias gpu='git push upstream'
alias gpu='git push -u'                 # --set-upstream
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref @)' # same as above

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbas='git rebase --autostash'
alias grbc='git rebase --continue'
alias grbd='git rebase develop'
alias grbi='git rebase -i' # --interactive
alias grbm='git rebase master'
alias grbs='git rebase --skip'

alias grmt='git remote'
alias grmta='git remote add'
alias grmtn='git remote rename'
alias grmtrm='git remote remove'
alias grmtset='git remote set-url'
alias grmtu='git remote update'
alias grmtv='git remote -v' # --verbose

alias gr='git reset'
alias grs='git reset --soft'
alias grh='git reset --hard'
alias groh='git reset origin/$(git rev-parse --abbrev-ref @) --hard'

alias grl='git reflog'

alias grm='git rm'
alias grmc='git rm --cached'

alias gs='git status'
alias gsi='git status --ignored'
alias gss='git status -s'     # --short
alias gssb='git status -s -b' # --short --branch

alias gsh='git show'
alias gshps='git show --pretty=short --show-signature'

alias gsl='git shortlog -sn'

alias gst='git stash push'
alias gsta='git stash apply'
alias gstall='git stash -a' # stash include untracked and ignore files (--all)
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstpi='git stash pop --index'
alias gsts='git stash show --text'

alias gsm='git submodule'
alias gsma='git submodule add'
alias gsmi='git submodule init'
alias gsmu='git submodule update'

alias gt='git tag'

alias guisw='git update-index --skip-worktree'
alias guinsw='git update-index --no-skip-worktree'
alias guiau='git update-index --assume-unchanged'
alias guinau='git update-index --no-assume-unchanged'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'

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
