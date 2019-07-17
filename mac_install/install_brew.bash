#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
source $SELF_DIR/display.bash

install_brew() {
  echo_title "!!!BREW INSTALATION!!!"

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update && brew upgrade
}


install_brew
