#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_programs(){
  echo_title "!!!PROGRAMS INSTALATION!!!"

  install_postgresql
  install_redis
  # install_chromedriver
  install_qt_5_5
  install_spacemax

  brew install htop
  brew install ctags
  brew install gpg
  brew install nodejs
  brew install md5sha1sum
  brew install capybara-webkit
  brew install tmux
  brew install cmake
  brew install overmind
  brew install imagemagick
  brew cask install chromedriver

  brew install mysql
  brew services start mysql
}

install_qt_5_5() {
  cd $( brew --prefix )/Homebrew/Library/Taps/homebrew/homebrew-core
  git fetch --unshallow
  git checkout 9ba3d6ef8891e5c15dbdc9333f857b13711d4e97 Formula/qt@5.5.rb
  sed -i '' '25,25 s/^/#/' Formula/qt@5.5.rb
  brew install qt@5.5
  cd ${ROOT_DIR}
}

install_postgresql() {
  brew install postgresql
  pg_ctl -D /usr/local/var/postgres start && brew services start postgresql
}

install_chromedriver() {
  cp "tools/chromedriver" "/usr/local/bin/chromedriver"
}

install_redis() {
  brew install redis
  brew services start redis
}
install_spacemax() {
  brew tap d12frosted/emacs-plus
  brew install emacs-plus
  brew linkapps emacs-plus
}


install_programs
