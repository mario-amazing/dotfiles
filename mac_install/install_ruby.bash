#!/bin/bash

SELF_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
ROOT_DIR=`dirname "$SELF_DIR"`

source $SELF_DIR/display.bash

default_gems() {
  gems_array=()
  while IFS= read -r line; do
    gems_array+=($line)
  done < "$ROOT_DIR/config/global.gems"

  echo ${gems_array[@]}
}

DEFAULT_GEMS=( $(default_gems) )

install_ruby() {
  echo_title "!!!RUBY INSTALATION!!!"

  # echo_question "What Ruby version control do you want?"

  # select ruby_manager in "RVM" "RBENV"; do
  #   case $ruby_manager in
  #     RVM ) install_rvm; break;;
  #     RBENV ) install_rbenv; break;;
  #   esac
  # done

  install_rbenv
  install_ruby_configs
}

install_rvm() {
  echo_title "!!!RVM INSTALATION!!!"

  install_ruby_rvm_configs
  gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s master
  source "$HOME/.rvm/scripts/rvm"
  rvm pkg install openssl

  rvm install ruby # install latest ruby
  rvm --default use ruby

  # manual_install_rvm_gems
}

install_rbenv() {
  echo_title "!!!RBENV INSTALATION!!!"
  echo_info "!!!IN A PROJECT USE: bundle install --path vendor/bundle!!!"

  install_ruby_rbenv_configs

  brew install rbenv rbenv-default-gems
  ln -vsf "$ROOT_DIR/config/global.gems" "$HOME/.rbenv/default-gems"

  RUBY_VERSION=$(rbenv install -l | grep -v - | tail -1)
  rbenv install "$RUBY_VERSION"
  rbenv global "$RUBY_VERSION"
  rbenv rehash

  # manual_install_rbenv_gems
}

install_ruby_rvm_configs(){
  echo_title "!!!RUBY RVM CONFIGS INSTALATION!!!"

  mkdir -p "$HOME/.rvm/gemsets"
  ln -vsf "$ROOT_DIR/config/global.gems" "$HOME/.rvm/gemsets/global.gems"
}

install_ruby_rbenv_configs(){
  echo_title "!!!RUBY RBENV CONFIGS INSTALATION!!!"

  mkdir -p "$HOME/.rbenv"

}

install_ruby_configs() {
  echo_title "!!!RUBY CONFIGS INSTALATION!!!"

  ln -vsf "$ROOT_DIR/config/pry/pryrc" "$HOME/.pryrc"
  ln -vsf "$ROOT_DIR/config/pry/pryrc_helpers.rb" "$HOME/.pryrc_helpers.rb"
  ln -vsf "$ROOT_DIR/config/irbrc" "$HOME/.irbrc"
  ln -vsf "$ROOT_DIR/config/gemrc" "$HOME/.gemrc"

  mkdir -p "$HOME/.config/solargraph"
  ln -vsf "$ROOT_DIR/config/solargraph_config.yml" "$HOME/.config/solargraph/config.yml"
}

manual_install_rvm_gems() {
  rvm @global do gem install ${DEFAULT_GEMS[*]}
}

manual_install_rbenv_gems() {
  gem install ${DEFAULT_GEMS[*]} --no-document
}

install_ruby
