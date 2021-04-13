#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`

source $SELF_DIR/display.bash

install_system_configs() {
  echo_title "!!!CONFIG INSTALATION!!!"

  add_empty_speaces_to_dock
  disable_dock_notifications_bounce
  # sudo bash -c "echo '127.0.0.1  localhost www.some.domain'>> /etc/hosts"
}

add_empty_speaces_to_dock() {
  for n in {1..5}; do
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}';
  done
  killall Dock
}

disable_dock_notifications_bounce() {
  defaults write com.apple.dock no-bouncing -bool TRUE
  killall Dock
}

install_system_configs
