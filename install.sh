SELF_DIR="$(dirname $0)"

install_pachages() {
  sudo apt-get install -f $@
}

install_git() {
  install_pachages git
  git config --global user.name  "$1"
  git config --global user.email "$2"
  git config --global push.default simple
}

install_tmux() {
  cp "$SELF_DIR/tmux.conf" "$HOME/.tmux.conf"
}

install_vim() {
  install_pachages vim-gnome
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  cp "$SELF_DIR/vimrc" "$HOME/.vimrc"
  vim +NeoBundleInstall +qall
}

install_zsh() {
  install_pachages zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cp "$SELF_DIR/zshrc" "$HOME/.zshrc"
}

install_term_colors() {
  cd /tmp
  local target_dir=base16
  git clone https://github.com/chriskempson/base16-builder.git "$target_dir"
  cd "$target_dir"
  ./base16
  bash "./output/gnome-terminal/base16-eighties.dark.sh"
  cd "$SELF_DIR"
}

install_ruby() {
  install_pachages git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/tpope/rbenv-aliases.git \
  ~/.rbenv/plugins/rbenv-aliases
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
  eval "$(rbenv init -)"

  rbenv install -v 2.2.1
  rbenv global 2.2.1
  rbenv alias --auto
}


install_git
install_zsh
install_vim
install_tmux

install_ruby
install_term_colors

