### andy@webdrive.co.nz [rev: 910e111]
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT="%F %T "
export EDITOR="/usr/bin/vim"

[ $(id -u) -ne 0 ] && PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \l \[\033[01;34m\]\w\[\033[00m\]]$ '
[ $(id -u) -eq 0 ] && PS1='[\[\033[01;31m\]\u@\h\[\033[00m\] \l \[\033[01;34m\]\w\[\033[00m\]]# '
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

umask 027
alias ls='ls --color=auto'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias ssh='ssh -At'

ssh-add

[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.aliases_local ] && . ~/.aliases_local

