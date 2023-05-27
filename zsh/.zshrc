
# Plugins
plugins=(git autojump fzf kubectl)

# AutoJump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

fpath=(~/.zsh/completion $fpath)
autoload -U compinit && compinit -u

# Common environment variables
# Node Version Manager Stuff
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"

export PATH=~/.nimble/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.local/share/coursier/bin:$PATH
export DENO_INSTALL=/home/aapclark/.deno
export PATH=$DENO_INSTALL/bin:$PATH
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH";
export PATH=~/packages/alacritty/target/release:$PATH
export PATH=$PATH:$HOME/bin

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
source $HOME/tacen/scripts/env.sh

fpath+=${ZDOTDIR:-~}/.zsh_functions
export PATH="/home/aapclark/.gvm/go/bin:$PATH"
