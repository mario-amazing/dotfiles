#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_programs(){
  echo_title "!!!PROGRAMS INSTALATION!!!"

  softwareupdate --install-rosetta

  brew install git
  brew install wget
  brew install fd # friendly find
  brew install rg
  # brew install ag
  # brew install md5sha1sum

  brew install fzf
  $(brew --prefix)/opt/fzf/install --no-bash --completion --key-bindings --update-rc

  brew install cmake
  brew install ctags
  brew install coreutils # command -> realpath
  brew install thefuck
  brew install htop

  install_python
  install_node_with_manager
  brew install npm
  brew install yarn
  brew install overmind
  brew install imagemagick
  brew install kubectl

  brew install postgresql
  brew install redis
  # brew install mysql

  ##======= Fonts
  brew tap homebrew/cask-fonts
  brew install --cask font-sauce-code-pro-nerd-font
  brew install --cask font-fontawesome

  ##======= UI Applications
  brew install --cask telegram
  brew install --cask slack
  brew install --cask skype
  brew install --cask zoom
  brew install --cask viber
  brew install --cask discord

  brew install --cask google-chrome
  brew install --cask vlc

  brew install --cask dropbox
  brew install --cask transmission
  brew install --cask tiles

  brew install --cask iterm2
  brew install --cask tableplus
  brew install --cask visual-studio-code
  brew install --cask docker
  brew install --cask postman

  brew install --cask steam
  brew install --cask appcleaner

  brew install --cask basictex
  # brew install --cask chromedriver
  # install_qt_5_5
}

install_qt_5_5() {
  cd $( brew --prefix )/Homebrew/Library/Taps/homebrew/homebrew-core
  git fetch --unshallow
  git checkout 9ba3d6ef8891e5c15dbdc9333f857b13711d4e97 Formula/qt@5.5.rb
  sed -i '' '25,25 s/^/#/' Formula/qt@5.5.rb
  brew install qt@5.5
  cd ${ROOT_DIR}
}

start_postgresql() {
  pg_ctl -D /usr/local/var/postgres start && brew services start postgresql
}

start_redis() {
  brew services start redis
}

start_mysql() {
  brew services start mysql
}

install_node_with_manager() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  nvm install node
  ln -vsf "$ROOT_DIR/default-npm-packages" "$NVM_DIR/default-packages"
  echo_info "!!!Inside project folder run => nvm use!!!"
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
