# call Prezto zshrc
[[ -f $HOME/.zprezto/runcoms/zshrc ]] && source $HOME/.zprezto/runcoms/zshrc

# redefine prompt_context for hiding user@hostname
prompt_context() { }

# alias settings
[[ -f $HOME/.aliasrc ]] && source $HOME/.aliasrc
[[ -f $HOME/.kokorc ]] && [[ $(whoami) == "Kokorin" ]] && source $HOME/.kokorc
[[ -f $HOME/.taiharc ]] && [[ $(whoami) == "taihara" || $(whoami) = "Aihara" ]] && source $HOME/.taiharc
alias -- -='cd -'
