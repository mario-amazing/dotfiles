#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`

source $SELF_DIR/display.bash

install_system_configs() {
  echo_title "!!!CONFIG INSTALATION!!!"

  add_empty_speaces_to_dock
  # sudo bash -c "echo '127.0.0.1  localhost www.some.domain'>> /etc/hosts"
}

add_empty_speaces_to_dock() {
  for n in {1..5}; do
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}';
  done
  killall Dock
}

install_system_configs
