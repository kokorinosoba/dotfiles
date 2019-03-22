# shell relogin alias
alias relogin="exec $SHELL -l"

# use trash instead of rm
alias trash="rmtrash"

# vim and nvim aliases
alias vimo="/usr/bin/vim"
alias vim="nvim"

# git shortened alias
alias g="git"

# make brew doctor wornings coming from using pyenv invisible
alias brew="env PATH=${PATH/\/Users\/Kokorin\/\.pyenv\/shims:/} brew"
