### andy.dustin@gmail.com [rev:9be5e6f]
[[ $- != *i* ]] && return

umask 027
shopt -s checkwinsize
shopt -s histappend
export HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT="%F %T "
export EDITOR="/usr/bin/vim"

#[ $(id -u) -ne 0 ] && PS1='\e[0m[\[\e[1;32m\]\u@\h\[\e[0m\] \l \[\e[1;34m\]\w\[\e[0m\]\e[95m`parse_git_branch`\e[0m]\$ '
#[ $(id -u) -eq 0 ] && PS1='\e[0m[\[\e[1;31m\]\u@\h\[\e[0m\] \l \[\e[1;34m\]\w\[\e[0m\]\e[95m`parse_git_branch`\e[0m]\$ '
[ $(id -u) -ne 0 ] && PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \l \[\033[01;34m\]\w\[\033[00m\]]$ '
[ $(id -u) -eq 0 ] && PS1='[\[\033[01;31m\]\u@\h\[\033[00m\] \l \[\033[01;34m\]\w\[\033[00m\]]# '
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

## Aliases
unalias -a
alias chmod='chmod -c'
alias chown='chown -c'
alias cp='cp -iv'
alias ls='ls -G'
alias mv='mv -iv'
alias rm='rm -v'
alias ssh='ssh -At'

## Functions
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

passgen() {
  for i in {1..6}; do 
    echo $(openssl rand -rand /dev/urandom -base64 28 2>/dev/null | sed -e 's|[+/]||g' | head -c12) | egrep -v '^[0-9]'
  done | head -3
}

vermp() {
  echo $(printf "%x\n" $(date +%y%j%H%M))
}


## Includes
[ -f ~/.aliases ] && . ~/.aliases

