
# Plugins
plugins=(git autojump fzf)

# AutoJump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Common environment variables
# Node Version Manager Stuff
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export ZSH="$HOME/.oh-my-zsh"
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
export PATH=~/.nimble/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.local/share/coursier/bin:$PATH
export DENO_INSTALL=/home/aapclark/.deno
export PATH=$DENO_INSTALL/bin:$PATH
# export STARSHIP_CONFIG=~/.config/starship.toml


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GHC
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

alias luamake=$HOME/lua-language-server/3rd/luamake/luamake

source $HOME/.config/broot/launcher/bash/br

source /home/aapclark/.config/broot/launcher/bash/br
export GPG_TTY=$(tty)

eval "$(starship init zsh)"
source $ZSH/oh-my-zsh.sh
