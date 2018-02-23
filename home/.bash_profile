export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CLICOLOR=1
export GIT_PS1_SHOWDIRTYSTATE=1

alias ls='ls -h'

# Colour configurations for man pages
# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
  LESS_TERMCAP_md=$'\e[1;36m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[1;40;92m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[1;32m' \
  command man "$@"
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    PS1='\h:\W$(__git_ps1 "\[\e[0;35m\](%s)")\[\e[0;39m\] \u\$ '
fi

if [ -e $(brew --prefix)/share/chruby ]; then
    . $(brew --prefix)/share/chruby/chruby.sh
    . $(brew --prefix)/share/chruby/auto.sh
    chruby ruby-2.4.1
fi

if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . $(python -c 'import pkgutil; print(pkgutil.get_loader("powerline").get_filename().rstrip("__init__.py"))' 2>/dev/null)bindings/bash/powerline.sh
fi
