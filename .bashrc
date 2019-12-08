### .bashrc is run when interactive bash starts.

# prompt setting
[[ -f $HOME/.bob-the-bash.sh ]] && source $HOME/.bob-the-bash.sh

# call .aliasrc
[[ -f $HOME/.aliasrc ]] && source $HOME/.aliasrc

# enable autocd
[[ $BASH_VERSINFO -ge 4 ]] && shopt -s autocd
