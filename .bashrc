# shell relogin alias
alias relogin="exec $SHELL -l"

# use trash instead of rm
alias trash="rmtrash"

# vim and nvim aliases
alias vimo="/usr/bin/vim"
alias vim="nvim"

# make brew doctor wornings coming from using pyenv invisible
alias brew="env PATH=${PATH/\/Users\/Kokorin\/\.pyenv\/shims:/} brew"

# java compile alias
alias juice="$HOME/Documents/Java/./juice.sh"

# c compile alias
alias coke="$HOME/Documents/Cprog/./coke.sh"

# c++ compile alias
alias calpis="$HOME/Documents/AOJ/AtCoder/APG4b/./calpis.sh"
