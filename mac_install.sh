#!/bin/sh
#TODO move to files functions
SELF_DIR="$PWD"

init_envs() {
  NORMAL='\033[0m'
  LRED='\033[1;31m'
  LGREEN='\033[1;32m'
  LYELLOW='\033[1;33m'
  LBLUE='\033[1;34m'
  LMAGENTA='\033[1;35m'
  LCYAN='\033[1;36m'

  export HOMEBREW_NO_AUTO_UPDATE=1
  global_gems=(bundler pry pry-rails interactive_editor awesome_print neovim rmagick shutup ripper-tags)
}

echo_title() {
  echo "${LCYAN}$1${NORMAL}\n"
}

install_brew() {
  echo_title "!!!BREW INSTALATION!!!"

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update && brew upgrade
}

install_git() {
  echo_title "!!!GIT INSTALATION!!!"

  ln -vsf "$SELF_DIR/gitignore_global" "$HOME/.gitignore_global"
  brew install git

  read -e -p "$(echo ${LGREEN}Enter Your git name: ${NORMAL})"  gitname
  read -e -p "$(echo ${LGREEN}Enter Your git email: ${NORMAL})"  gitemail

  git config --global user.name ${gitname}
  git config --global user.email ${gitemail}
  git config --global color.ui true
  git config --global push.default current
  git config --global core.excludesfile ~/.gitignore_global
  git config --global help.autoCorrect -1
}

install_vim() {
  echo_title "!!!VIM INSTALATION!!!"

  brew install vim neovim
  brew install the_silver_searcher

  brew install python3 python2
  pip3 install neovim
  pip install neovim

  brew install npm
  npm install -g neovim

  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p "$HOME/.vim"

  ln -vsf "$SELF_DIR/vim/vimrc" "$HOME/.vimrc"
  ln -vsf "$SELF_DIR/vim/vim/colors" "$HOME/.vim"
  ln -vsf "$SELF_DIR/vim/vim/modules" "$HOME/.vim"
  ln -vsf "$SELF_DIR/vim/vim/ultisnips" "$HOME/.vim"
  cp -r "$SELF_DIR/vim/vim/autoload" "$HOME/.vim"
  cp -r "$SELF_DIR/vim/vim/tmp" "$HOME/.vim"

  mkdir -p ~/.config
  ln -vsf ~/.vim ~/.config/nvim
  ln -vsf ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PlugInstall +qa
  nvim +PlugUpdate +qa
  nvim +UpdateRemotePlugins +qa
}

install_fonts() {
  echo_title "!!!FONTS INSTALATION!!!"

  cp -r "$SELF_DIR/fonts/zsh_powerline_fonts" "/Library/Fonts"
}

install_zsh() {
  echo_title "!!!ZSH INSTALATION!!!"

  ln -vsf "$SELF_DIR/zsh/zshrc" "$HOME/.zshrc"
  mkdir -pv "$HOME/.zsh/backup"
  mv -v "$HOME/.zsh/themes" "$HOME/.zsh/backup/themes"
  ln -vsf "$SELF_DIR/zsh/themes" "$HOME/.zsh"

  brew install zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  brew tap sambadevi/powerlevel9k
  brew install powerlevel9k
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

  # chsh -s `which zsh`
  chsh -s /bin/zsh
}

install_ruby() {
  echo_title "!!!RUBY INSTALATION!!!"

  echo "${LGREEN}What Ruby version control do you want?${NORMAL}"
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
  brew install rbenv-gemset
  rbenv install 2.6.3
  rbenv global 2.6.3
  rbenv rehash

  install_rbenv_gems
}

install_ruby_configs() {
  echo_title "!!!RUBY CONFIGS INSTALATION!!!"

  ln -vsf "$SELF_DIR/pry/pryrc" "$HOME/.pryrc"
  ln -vsf "$SELF_DIR/pry/pryrc_helpers.rb" "$HOME/.pryrc_helpers.rb"
  ln -vsf "$SELF_DIR/irbrc" "$HOME/.irbrc"
  ln -vsf "$SELF_DIR/gemspec_template" "$HOME/.gemspec_template"
}

install_postgresql() {
  brew install postgresql
  pg_ctl -D /usr/local/var/postgres start && brew services start postgresql
}

install_chromedriver() {
  cp "tools/chromedriver" "/usr/local/bin/chromedriver"
}

install_rvm_gems() {
  # TODO add option all-gemsets https://rvm.io/set/do
  rvm @global do gem install ${global_gems[*]}
}

install_rbenv_gems() {
  gem install ${global_gems[*]} --no-rdoc --no-ri
}

install_programs(){
  echo_title "!!!PROGRAMS INSTALATION!!!"

  install_postgresql
  install_chromedriver
  install_qt_5_5

  brew install htop
  brew install ctags
  brew install gpg
  brew install nodejs
  brew install md5sha1sum
  brew install capybara-webkit
  brew install tmux
  brew install overmind

  brew install mysql
  brew services start mysql
}

install_steam() {
  echo_title "!!!STEAM INSTALATION!!!"

  brew cask install steam
}

tmp_configs() {
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

install_qt_5_5() {
  cd $( brew --prefix )/Homebrew/Library/Taps/homebrew/homebrew-core
  git fetch --unshallow
  git checkout 9ba3d6ef8891e5c15dbdc9333f857b13711d4e97 Formula/qt@5.5.rb
  sed -i '' '25,25 s/^/#/' Formula/qt@5.5.rb
  brew install qt@5.5
  cd ${SELF_DIR}
}


init_envs

tmp_configs
install_brew
install_git
install_ruby
install_fonts
install_steam
install_programs
install_vim
install_zsh
