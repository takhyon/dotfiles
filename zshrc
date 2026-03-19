# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git terraform vscode macos aws vi-mode)
SHOW_AWS_PROMPT=false
source $ZSH/oh-my-zsh.sh

# Custom config
source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/proxy.zsh

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

. "$HOME/.local/bin/env"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# Docker CLI completions
fpath=(~/.zsh/completions /Users/salrea/.docker/completions $fpath)
autoload -Uz compinit
compinit
