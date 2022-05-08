#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_programs(){
  echo_title "!!!PROGRAMS INSTALATION!!!"

  softwareupdate --install-rosetta

  install_python
  install_postgresql
  install_redis
  # install_chromedriver
  # install_qt_5_5

  brew install coreutils # command -> realpath
  brew install rg
  brew install ag
  brew install thefuck
  brew install htop
  brew install ctags
  brew install gpg
  brew install nodejs
  # brew install md5sha1sum
  brew install cmake
  brew install overmind
  brew install imagemagick
  brew install --cask chromedriver
  brew install kubectl

  brew install mysql
  # brew services start mysql
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
  # pg_ctl -D /usr/local/var/postgres start && brew services start postgresql
}

install_chromedriver() {
  cp "tools/chromedriver" "/usr/local/bin/chromedriver"
}

install_redis() {
  brew install redis
  # brew services start redis
}

install_python() {
  brew install python3

  brew install pipenv

  pip3 install --upgrade flake8
  pip3 install --upgrade jedi
  pip3 install --upgrade yapf
  pip3 install --upgrade pdbpp
  pip3 install --upgrade ipdb
  pip3 install --upgrade ipython
  pip3 install --upgrade dynamic-yaml

  # for vim
  pip3 install --upgrade neovim
  pip3 install --upgrade pynvim
  pip3 install --upgrade msgpack
  pip3 install --upgrade python-language-server
}

install_programs
