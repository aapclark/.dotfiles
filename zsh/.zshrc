# Plugins
plugins=(git zoxide fzf kubectl)

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
export PATH=~/packages:$PATH
export PATH=$PATH:$HOME/bin
export FLYCTL_INSTALL="/home/aapclark/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# GHC
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
alias luamake=$HOME/lua-language-server/3rd/luamake/luamake
alias zel=zellij
alias n=nvim
source $HOME/.config/broot/launcher/bash/br
source /home/aapclark/.config/broot/launcher/bash/br
export GPG_TTY=$(tty)
eval "$(starship init zsh)"
source $ZSH/oh-my-zsh.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions
export PATH="/home/aapclark/.gvm/go/bin:$PATH"
export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"
export GOROOT="$HOME/.gobrew/current/go"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/aapclark/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/aapclark/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
# bun completions
[ -s "/home/aapclark/.bun/_bun" ] && source "/home/aapclark/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script

# opencode
export PATH=/home/aapclark/.opencode/bin:$PATH
