#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_vim() {
  echo_title "!!!VIM INSTALATION!!!"

  brew install vim neovim
  brew install the_silver_searcher
  # brew install --cask mactex # fix latexmk checkhealth error

  brew install npm
  npm install -g neovim

  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p "$HOME/.vim"

  ln -vsf "$ROOT_DIR/vim/vimrc" "$HOME/.vimrc"
  ln -vsf "$ROOT_DIR/vim/vim/colors" "$HOME/.vim"
  ln -vsf "$ROOT_DIR/vim/vim/modules" "$HOME/.vim"
  ln -vsf "$ROOT_DIR/vim/vim/syntax" "$HOME/.vim"
  cp -r "$ROOT_DIR/vim/vim/tmp" "$HOME/.vim"

  mkdir -p ~/.config
  ln -vsf ~/.vim ~/.config/nvim
  ln -vsf ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PlugInstall +qa
  nvim +PlugUpdate +qa
  nvim +UpdateRemotePlugins +qa
}

install_vim
