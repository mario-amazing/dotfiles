#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_fonts() {
  echo_title "!!!FONTS INSTALATION!!!"

  cp -r "$ROOT_DIR/fonts/zsh_powerline_fonts" "/Library/Fonts"
}


install_fonts
