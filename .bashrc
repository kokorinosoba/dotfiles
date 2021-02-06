### .bashrc is run when interactive bash starts.

# prompt setting
[[ -f $HOME/.bob-the-bash.sh ]] && source $HOME/.bob-the-bash.sh

# right prompt setting
function __command_rprompt() {
  local rprompt=$(LANG=C date +"%a %b %d %H:%M:%S %Y")  # 右プロンプトに表示させる内容。今回はタイムスタンプ。
  local num=$(($COLUMNS - ${#rprompt}))  # 右プロンプトを表示するために必要となる幅
  printf "%${num}s$rprompt\r" ''  # 右プロンプトの表示(\rがないとうまく動作しないので注意)
}
PROMPT_COMMAND=__command_rprompt

# git completion
[[ -f $HOME/.git-completion.bash ]] &&  source $HOME/.git-completion.bash

# git prompt
# [[ -f $HOME/.git-prompt.sh ]] && source $HOME/.git-prompt.sh && PS1=' \w\[\033[32m\]$(__git_ps1)\[\033[00m\] \[\033[35m\]$\[\033[0m\]'
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto

# alias settings
[[ -f $HOME/.aliasrc ]] && source $HOME/.aliasrc
[[ -f $HOME/.kokorc ]] && [[ $(whoami) == "Kokorin" ]] && source $HOME/.kokorc
[[ -f $HOME/.taiharc ]] && [[ $(whoami) == "taihara" || $(whoami) = "Aihara" ]] && source $HOME/.taiharc
alias -- -='cd -'

# enable autocd
[[ $BASH_VERSINFO -ge 4 ]] && shopt -s autocd
