#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_git() {
  echo_title "!!!GIT INSTALATION!!!"

  ln -vsf "$ROOT_DIR/gitignore_global" "$HOME/.gitignore_global"
  brew install git

  read -e -p "$(echo -e ${LGREEN}Enter Your git name: ${NORMAL})"  gitname
  read -e -p "$(echo -e ${LGREEN}Enter Your git email: ${NORMAL})"  gitemail

  # Split to default user .gitconfig and manual setup
  git config --global user.name ${gitname}
  git config --global user.email ${gitemail}
  git config --global color.ui true
  git config --global push.default current
  git config --global core.excludesfile ~/.gitignore_global
  git config --global core.editor vim
  git config --global branch.autosetuprebase always

  git config --global help.autoCorrect -1
}


install_git
