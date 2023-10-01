# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export TERMINAL=konsole

if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]]; then
  exec tbsm
fi
