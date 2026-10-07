# Plugins
plugins=(git zoxide fzf kubectl)

fpath=(~/.zsh/completion $fpath)
# Common environment variables
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
alias oc=opencode
source $HOME/.config/broot/launcher/bash/br
export GPG_TTY=$(tty)
eval "$(starship init zsh)"
source $ZSH/oh-my-zsh.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/aapclark/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/aapclark/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
# bun completions
[ -s "/home/aapclark/.bun/_bun" ] && source "/home/aapclark/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script

# opencode
export PATH=/home/aapclark/.opencode/bin:$PATH

# git worktree helper
worktree() {
  local branch="$1"
  if [[ -z "$branch" ]]; then
    echo "Usage: worktree <branch>"
    return 1
  fi
  mkdir -p "../worktrees"
  git worktree add -b "$branch" "../worktrees/${branch}" || return
  cd "../worktrees/${branch}"
}

eval "$(mise activate zsh)"
