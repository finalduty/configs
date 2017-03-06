### andy.dustin@gmail.com [rev:a2befec]

[[ $- != *i* ]] && return

umask 027
shopt -s checkwinsize
shopt -s histappend
export HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT="%F %T "
export EDITOR="/usr/bin/vim"

[ $(id -u) -ne 0 ] && PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \l \[\033[01;34m\]\w\[\033[00m\]]$ '
[ $(id -u) -eq 0 ] && PS1='[\[\033[01;31m\]\u@\h\[\033[00m\] \l \[\033[01;34m\]\w\[\033[00m\]]# '
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

## Aliases
unalias -a
alias chmod='chmod -c'
alias chown='chown -c'
alias cp='cp -iv'
alias ls='ls --color=always'
alias ln='ln -v' 
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -v'
alias ssh='ssh -At'
alias systemclt='systemctl'
alias systemctl='systemctl -l --no-pager'

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

