### Column ###
# funny commands
# say, banner, sl, ncal, rig, yes, time cat, toilet, cowsay, cmatrix, fortune, lolcat, asciiquarium, nyancat
# ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'

# .bashrc includes prompt, alias and autocd settings
[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc

# display welcome message
type figlet > /dev/null 2>&1 &&
figlet -f smslant WELCOME TO BASH

# display todo list
type todo > /dev/null 2>&1 &&
todo ls --all
