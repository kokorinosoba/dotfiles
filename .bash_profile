### Column ###
# funny commands
# say, banner, sl, ncal, rig, yes, time cat, toilet, cowsay, cmatrix, fortune, lolcat, asciiquarium, nyancat
# ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'

# right prompt setting
function __command_rprompt() {
  local rprompt=$(date +"%a %m/%d %H:%M:%S %Y")  # 右プロンプトに表示させる内容。今回はタイムスタンプ。
  local num=$(($COLUMNS - ${#rprompt} - 2))  # 右プロンプトを表示するために必要となる幅
  printf "%${num}s$rprompt\r" ''  # 右プロンプトの表示(\rがないとうまく動作しないので注意)
}
PROMPT_COMMAND=__command_rprompt

# prompt setting
# PS1=' \W \[\033[35m\]$\[\033[0m\]'
PS1='\[\e[30;47m\] \w $(git-ps)'

# call .pathrc
[[ -f $HOME/.pathrc ]] && source $HOME/.pathrc

# call .bashrc
[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc

# enable autocd
[[ $BASH_VERSINFO -ge 4 ]] && shopt -s autocd

# git completion and prompt
[[ -f $HOME/.git-completion.bash ]] &&  source $HOME/.git-completion.bash
# [[ -f $HOME/.git-prompt.sh ]] && source $HOME/.git-prompt.sh && PS1=' \w\[\033[32m\]$(__git_ps1)\[\033[00m\] \[\033[35m\]$\[\033[0m\]'

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# display welcome message
figlet -f smslant WELCOME TO BASH

# display todo list
todo ls --all
