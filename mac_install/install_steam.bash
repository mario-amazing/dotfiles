#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`

source $SELF_DIR/display.bash

install_steam() {
  echo_title "!!!STEAM INSTALATION!!!"

  brew cask install steam
}


install_steam
