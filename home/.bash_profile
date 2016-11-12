export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export CLICOLOR=1
export GIT_PS1_SHOWDIRTYSTATE=1

alias ls='ls -h'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    PS1='\h:\W$(__git_ps1 "\[\e[0;35m\](%s)")\[\e[0;39m\] \u\$ '
fi

if [ -e $(brew --prefix)/share/chruby ]; then
    . $(brew --prefix)/share/chruby/chruby.sh
    . $(brew --prefix)/share/chruby/auto.sh
    chruby ruby-2.3.0
fi

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . $(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2>/dev/null)/bindings/bash/powerline.sh
fi
