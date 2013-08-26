export CLICOLOR=1
export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

[[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion

if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
    . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
    PS1='\h:\W$(__git_ps1 "\[\e[0;35m\](%s)")\[\e[0;39m\] \u\$ '
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
