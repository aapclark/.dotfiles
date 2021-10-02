# Node Version Manager Stuff
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(
  autojump
  fzf
  git
)

# AutoJump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Common environment variables
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.nimble/bin
export PATH=$PATH:~/.local/bin

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GHC
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

alias luamake=$HOME/lua-language-server/3rd/luamake/luamake

source $HOME/.config/broot/launcher/bash/br

source /home/aapclark/.config/broot/launcher/bash/br
export GPG_TTY=$(tty)

eval "$(starship init zsh)"
