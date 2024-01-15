#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

install_nvim() {
  sudo apt install -y build-essential
  sudo apt install -y vim

  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt update
  sudo apt install -y neovim

  apt install ripgrep # ripgrep source for cmp-rg

  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin

  mkdir -p "$HOME/.config/lazygit"
  ln -vsf "$ROOT_DIR/config/lazygit_config.yml" "$HOME/.config/lazygit/config.yml"

  mkdir -p ~/.config/nvim
  ln -vsf "$ROOT_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
  ln -vsf "$ROOT_DIR/nvim/lua" "$HOME/.config/nvim/lua"
  ln -vsf "$ROOT_DIR/nvim/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"
  mkdir -p "$HOME/.config/nvim/tmp/backup"

  nvim +Lazy update +qa
}

install_nvim
