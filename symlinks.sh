#!/bin/bash
set -euo pipefail

ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/authproxy-config ~/.authproxy-config
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/packaged-goods /usr/local/bin/packaged-goods
mkdir -p ~/.zsh/completions
ln -sf ~/.dotfiles/_packaged-goods ~/.zsh/completions/_packaged-goods
