fpath+=$HOME/.zsh/pure

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Path to your oh-my-zsh installation.
export ZSH="/Users/apclark/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Plugins

plugins=(autojump fzf)

# User configuration

[[ -s /Users/apclark/.autojump/etc/profile.d/autojump.sh ]] && source /Users/apclark/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Common environment variables
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/unison/.stack-work/install/x86_64-osx/650644a978093caee0e933cd3412ccc0852fc2b0bb8341f27327c5f07c2c9ee4/8.10.3/bin/
export PATH=/Users/apclark/.nimble/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/Users/apclark/.ghcup/env" ] && source "/Users/apclark/.ghcup/env" # ghcup-env

alias luamake=$HOME/lua-language-server/3rd/luamake/luamake
alias nvim=$HOME/nvim-osx64/bin/nvim

source $HOME/.config/broot/launcher/bash/br
