#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_nvim() {
  echo_title "!!!NVIM INSTALATION!!!"

  brew install vim neovim

  brew install ripgrep # ripgrep source for cmp-rg

  brew install lazygit
  mkdir -p "$HOME/.config/lazygit"
  ln -vsf "$ROOT_DIR/config/lazygit_config.yml" "$HOME/.config/lazygit/config.yml"

  # vim-xkbswitch
  curl -fLo /usr/local/bin/libxkbswitch.dylib https://raw.githubusercontent.com/myshov/libxkbswitch-macosx/master/bin/libxkbswitch.dylib
  curl -fLo /usr/local/bin/xkbswitch          https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
  chmod +x /usr/local/bin/xkbswitch

  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  mkdir -p ~/.config/nvim
  ln -vsf "$ROOT_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
  ln -vsf "$ROOT_DIR/nvim/lua" "$HOME/.config/nvim/lua"
  mkdir -p "$HOME/.config/nvim/tmp/backup"

  nvim +PlugUpdate +qa
}

install_nvim
