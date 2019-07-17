#!/bin/bash

SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

DEFAULT_GEMS=(bundler pry pry-rails interactive_editor awesome_print neovim rmagick shutup ripper-tags)

install_ruby() {
  echo_title "!!!RUBY INSTALATION!!!"

  echo -e "${LGREEN}What Ruby version control do you want?${NORMAL}"
  select yn in "RVM" "RBENV"; do
    case $yn in
      RVM ) install_rvm; break;;
      RBENV ) install_rbenv; break;;
    esac
  done

  install_ruby_configs
}

install_rvm() {
  echo_title "!!!RVM INSTALATION!!!"

  install_ruby_rvm_configs
  gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  install rvm
  \curl -sSL https://get.rvm.io | bash -s stable --rails
  source "$HOME/.rvm/scripts/rvm"
  rvm pkg install openssl
  # rvm install 2.6.3
  # rvm use 2.6.3 --default
  install_rvm_gems
}

install_rbenv() {
  echo_title "!!!RBENV INSTALATION!!!"

  brew install rbenv
  rbenv install 2.6.3
  rbenv global 2.6.3
  rbenv rehash

  install_rbenv_gems
}

install_ruby_rvm_configs(){
  echo_title "!!!RUBY RVM CONFIGS INSTALATION!!!"

  mkdir -p "$HOME/.rvm/gemsets"
  ln -vsf "$ROOT_DIR/global.gems" "$HOME/.rvm/gemsets/global.gems "
}

install_ruby_configs() {
  echo_title "!!!RUBY CONFIGS INSTALATION!!!"

  ln -vsf "$ROOT_DIR/pry/pryrc" "$HOME/.pryrc"
  ln -vsf "$ROOT_DIR/pry/pryrc_helpers.rb" "$HOME/.pryrc_helpers.rb"
  ln -vsf "$ROOT_DIR/irbrc" "$HOME/.irbrc"
  ln -vsf "$ROOT_DIR/gemspec_template" "$HOME/.gemspec_template"
  ln -vsf "$ROOT_DIR/gemrc" "$HOME/.gemrc"
}

install_rvm_gems() {
  # TODO add option all-gemsets https://rvm.io/set/do
  rvm @global do gem install ${DEFAULT_GEMS[*]}
}

install_rbenv_gems() {
  gem install ${DEFAULT_GEMS[*]} --no-rdoc --no-ri
}


install_ruby
