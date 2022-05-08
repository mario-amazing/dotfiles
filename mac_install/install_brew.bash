#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
source $SELF_DIR/display.bash

install_brew() {
  echo_title "!!!BREW INSTALATION!!!"

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update && brew upgrade
}


install_brew
