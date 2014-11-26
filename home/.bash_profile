export CLICOLOR=1
export GIT_PS1_SHOWDIRTYSTATE=1
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

alias ls='ls -h'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
    PS1='\h:\W$(__git_ps1 "\[\e[0;35m\](%s)")\[\e[0;39m\] \u\$ '
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 