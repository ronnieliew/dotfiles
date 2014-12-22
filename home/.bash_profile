export CLICOLOR=1
export GIT_PS1_SHOWDIRTYSTATE=1

alias ls='ls -h'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
    PS1='\h:\W$(__git_ps1 "\[\e[0;35m\](%s)")\[\e[0;39m\] \u\$ '
fi

if [ -e $(brew --prefix)/share/chruby ]; then
    . /usr/local/share/chruby/chruby.sh
    . /usr/local/share/chruby/auto.sh
    chruby ruby-2.1.3
fi