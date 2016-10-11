### andy.dustin@gmail.com [rev: 9b4ea04]
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s histappend
export HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT="%F %T "
export EDITOR="/usr/bin/vim"

[ $(id -u) -ne 0 ] && PS1='\e[0m[\[\e[1;32m\]\u@\h\[\e[0m\] \l \[\e[1;34m\]\w\[\e[0m\]\e[95m`parse_git_branch`\e[0m]\$ '
[ $(id -u) -eq 0 ] && PS1='\e[0m[\[\e[1;31m\]\u@\h\[\e[0m\] \l \[\e[1;34m\]\w\[\e[0m\]\e[95m`parse_git_branch`\e[0m]\$ '
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

umask 027
alias ls='ls --color=auto'
alias mv='mv -iv'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias ssh='ssh -At'

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

[ -f ~/.aliases ] && . ~/.aliases

