#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_zsh() {
  echo_title "!!!ZSH INSTALATION!!!"

  ln -vsf "$ROOT_DIR/zsh/zshrc" "$HOME/.zshrc"
  ln -vsf "$ROOT_DIR/zsh/p10k.zsh" "$HOME/.p10k.zsh"
  cp "$ROOT_DIR/zsh/hushlogin" "$HOME/.hushlogin"
  mkdir -pv "$HOME/.zsh/backup"
  mv -v "$HOME/.zsh/themes" "$HOME/.zsh/backup/themes"
  ln -vsf "$ROOT_DIR/zsh/themes" "$HOME/.zsh"
  ln -vsf "$ROOT_DIR/zsh/aliases.zsh" "$HOME/.zsh"

  brew install zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  # chsh -s `which zsh`
  chsh -s /bin/zsh
}


install_zsh
