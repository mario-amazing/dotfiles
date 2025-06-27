#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

install_programs(){
  echo_title "!!!PROGRAMS INSTALATION!!!"

  softwareupdate --install-rosetta

  ##======= UI Applications
  brew install --cask steam
  brew install --cask appcleaner

  brew install --cask google-chrome
  brew install --cask opera
  brew install --cask yandex
  brew install --cask firefox

  brew install --cask telegram
  # brew install --cask slack
  # brew install --cask skype
  brew install --cask zoom
  brew install --cask viber
  brew install --cask discord

  brew install --cask iterm2
  brew install --cask tableplus
  brew install --cask visual-studio-code
  brew install --cask docker
  brew install --cask postman
  brew install --cask ngrok  # proxy localhost server
  brew install --cask responsively

  brew install --cask tunnelbear
  brew install --cask dropbox
  brew install --cask google-drive
  brew install --cask transmission
  brew install --cask tiles
  brew install --cask keycastr
  brew install --cask vlc

  # Vim
  brew install prettierd

  brew install --cask basictex
  # brew install --cask chromedriver

  brew install cmake
  brew install git
  brew install git-delta
  brew install curl
  brew install wget
  brew install fd # friendly find
  brew install rg
  ln -vsf "$ROOT_DIR/config/ripgrep.ignore" "$HOME/.config/.ignore"

  brew install jq # prettify json
  # brew install ag
  # brew install md5sha1sum

  brew install fzf
  $(brew --prefix)/opt/fzf/install --no-bash --completion --key-bindings --update-rc

  # brew install ctags
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  brew install coreutils # command -> realpath
  brew install thefuck
  brew install htop
  brew install libsass

  install_python
  install_node_with_manager
  brew install npm
  brew install yarn
  brew install overmind
  brew install vips
  brew install kubectl
  brew install docker-compose
  brew install rust # for ruby -yjit

  brew install tlk/imagemagick-x11/imagemagick
  brew install --cask xquartz # display image with imagemagick(run xquartz before display)

  brew install postgresql@17 libpq
  brew install redis
  # brew install mysql

  ##======= Fonts
  brew install --cask font-sauce-code-pro-nerd-font
  brew install --cask font-fontawesome

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
  brew install nodenv
  brew install nodenv/nodenv/nodenv-default-packages
  ln -vsf "$ROOT_DIR/config/nodenv_default_packages" "$(nodenv root)/default-packages"
}

install_python() {
  brew install python3

  brew install pipenv

  pip3 install --upgrade flake8 --break-system-packages
  pip3 install --upgrade jedi --break-system-packages
  pip3 install --upgrade yapf --break-system-packages
  pip3 install --upgrade pdbpp --break-system-packages
  pip3 install --upgrade ipdb --break-system-packages
  pip3 install --upgrade ipython --break-system-packages
  pip3 install --upgrade dynamic-yaml --break-system-packages

  # for vim
  pip3 install --upgrade neovim --break-system-packages
  pip3 install --upgrade pynvim --break-system-packages
  pip3 install --upgrade msgpack --break-system-packages
  pip3 install --upgrade python-language-server --break-system-packages
}

install_programs
