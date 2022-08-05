#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_vim() {
  echo_title "!!!VIM INSTALATION!!!"

  brew install vim neovim

  brew install ripgrep # ripgrep source for cmp-rg

  brew install lazygit
  mkdir -p "$HOME/.config/lazygit"
  ln -vsf "$ROOT_DIR/lazygit_config.yml" "$HOME/.config/lazygit/config.yml"

  # vim-xkbswitch
  curl -fLOo /usr/local/bin https://raw.githubusercontent.com/myshov/libxkbswitch-macosx/master/bin/libxkbswitch.dylib
  curl -fLOo /usr/local/bin https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
  chmod +x /usr/local/bin/xkbswitch

  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p ~/.vim

  ln -vsf "$ROOT_DIR/vim/vimrc" "$HOME/.vimrc"
  ln -vsf "$ROOT_DIR/vim/vim/modules" "$HOME/.vim"

  mkdir -p ~/.config/nvim
  ln -vsf "$ROOT_DIR/vim/init.lua" "$HOME/.config/nvim/init.lua"
  ln -vsf "$ROOT_DIR/vim/lua" "$HOME/.config/nvim/lua"
  mkdir -p "$HOME/.config/nvim/tmp/backup"

  nvim +PlugInstall +qa
  nvim +PlugUpdate +qa
}

install_vim
