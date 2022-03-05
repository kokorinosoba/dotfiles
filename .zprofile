# call Prezto zprofile
[[ -f $HOME/.zprezto/runcoms/zprofile ]] && source $HOME/.zprezto/runcoms/zprofile

# call .aliasrc
[[ -f $HOME/.aliasrc ]] && source $HOME/.aliasrc

# display welcome message
type toilet > /dev/null 2>&1 &&
toilet -f pagga WELCOME TO ZSH

# display todo list
type todo > /dev/null 2>&1 &&
todo ls --all
