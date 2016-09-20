### andy.dustin@gmail.com [rev: 9b1b5c6]
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend
export HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT="%F %T "
export EDITOR="/usr/bin/vim"

[ $(id -u) -ne 0 ] && PS1='\e[0m[\e[1;32m\u@\h\e[0m \l \e[1;34m\w\e[0m]\$ '
[ $(id -u) -eq 0 ] && PS1='\e[0m[\e[1;31m\u@\h\e[0m \l \e[1;34m\w\e[0m]\$ '
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

umask 027
alias ls='ls --color=auto'
alias mv='mv -iv'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias ssh='ssh -At'

[ -f ~/.aliases ] && . ~/.aliases

