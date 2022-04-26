#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`

source $SELF_DIR/display.bash

install_system_configs() {
  echo_title "!!!CONFIG INSTALATION!!!"

  remove_all_from_dock
  add_empty_speaces_to_dock
  disable_dock_notifications_bounce
  disable_app_store_notifacations
  # sudo bash -c "echo '127.0.0.1  localhost www.some.domain'>> /etc/hosts"
}

remove_all_from_dock() {
  defaults write com.apple.dock persistent-apps -array
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

disable_app_store_notifacations() {
  defaults write com.apple.appstored LastUpdateNotification -date "2029-12-12 12:00:00 +0000"
}

install_system_configs
