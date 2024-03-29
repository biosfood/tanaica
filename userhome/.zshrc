HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

eval "$(oh-my-posh init zsh --config ~/.config/tanaica/oh-my-posh.json)"
bindkey -v
bindkey "^[[3~" delete-char

eval $(thefuck --alias)

export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts"

source /opt/intel/oneapi/mkl/latest/env/vars.sh
source /opt/intel/oneapi/compiler/latest/env/vars.sh

neofetch
