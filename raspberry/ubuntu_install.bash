#TODO  settings, su, sudo update after install
# SELF_DIR="$(dirname $0)"
SELF_DIR=`realpath $(dirname $BASH_SOURCE)`
ROOT_DIR=`dirname "$SELF_DIR"`

copy(){
  yes | cp -f $@
}

install_pachages() {
  for i in $@; do
    sudo apt install -y --force-yes $i
  done
}

remove_pachages(){
  for i in $@; do
    sudo apt purge -y $i
  done
}

install_vim() {
  sudo add-apt-repository -y ppa:neovim-ppa/unstable
  sudo apt-get update
  install_pachages vim-gnome neovim
  install_pachages python-neovim python3-neovim python-pip python3-pip python-pip python-dev python3-dev
  install_pachages software-properties-common exuberant-ctags
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir $HOME/.vim -p
  copy -r $SELF_DIR/vim/vim/* $HOME/.vim
  copy $SELF_DIR/vim/vimrc $HOME/.vimrc
  mkdir ~/.config
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PlugInstall
}

install_fonts() {
  mkdir $HOME/.fonts -p
  copy -r $SELF_DIR/fonts/* $HOME/.fonts
  fc-cache
}

install_zsh() {
  install_pachages zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  mkdir -p "$HOME/.zsh"
  ln -vsf "$ROOT_DIR/zsh/raspberry/zshrc" "$HOME/.zshrc"
  ln -vsf "$ROOT_DIR/zsh/raspberry/aliases.zsh" "$HOME/.zsh/aliases.zsh"

  chsh -s `which zsh`
}

install_ruby() {
  ln -vsf "$ROOT_DIR/pry/pryrc" "$HOME/.pryrc"
  ln -vsf "$ROOT_DIR/pry/pryrc_helpers.rb" "$HOME/.pryrc_helpers.rb"
  ln -vsf "$ROOT_DIR/irbrc" "$HOME/.irbrc"
  ln -vsf "$ROOT_DIR/gemspec_template" "$HOME/.gemspec_template"
  ln -vsf "$ROOT_DIR/gemrc" "$HOME/.gemrc"

  install_pachages curl g++, gcc, autoconf, automake, bison, libc6-dev, libffi-dev, libgdbm-dev, libncurses5-dev, libsqlite3-dev, libtool, libyaml-dev, make, pkg-config, sqlite3, zlib1g-dev, libgmp-dev, libreadline-dev, libssl-dev
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s stable
  source ~/.rvm/scripts/rvm
  rvm install 2.6
  rvm --default use ruby-2.6
}

install_gems() {
  gem install bundler
  gem install pry
  gem install pry-rails
  gem install interactive_editor
  gem install awesome_print
  gem install neovim
  gem install rmagick
  gem install shutup
}

install_homebridge(){
  # https://github.com/nfarina/homebridge/wiki/Install-Homebridge-on-Raspbian
  install_pachages nodejs
  install_pachages libavahi-compat-libdnssd-dev
  install_pachages npm
  sudo npm install -g --unsafe-perm homebridge
  sudo useradd -m --system homebridge
  sudo mkdir -p /var/lib/homebridge

  # Plugins
  sudo npm install -g homebridge-yeelight-wifi
}

install_programs(){
  install_pachages ubuntu-desktop
	install_pachages postgresql postgresql-contrib
  # install_pachages htop
  # install_pachages ubuntu-restricted-extras   #Flash,java,audio-,video-codecs
  # install_pachages chromium-browser pepperflashplugin-nonfree
  # install_pachages sni-qt:i386 libdbusmenu-qt2:i386 libqt4-dbus:i386 libxss1:i386 libasound2-plugins:i386
  # install_pachages skype
  # install_pachages vlc krita  #Video-player and paint
  # install_pachages clementine
  # install_pachages dconf-tools  #configs
  # install_pachages preload  #cache the most used programs
  # install_pachages ncurses-dev #libs-dev
  # install_pachages libpq-dev
  # install_pachages silversearcher-ag #ag to ctrl-p plagin
  # install_pachages imagemagick libmagickwand-dev
  # cd /tmp

  # install_pachages gdebi
  # wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  # sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  # sudo apt-get update ; install_pachages google-chrome-stable

  # wget http://de.archive.ubuntu.com/ubuntu/pool/universe/q/qtmobility/libqtmultimediakit1_1.2.0-1ubuntu2_amd64.deb  #screen window
  # sudo dpkg -i libqtmultimediakit1_1.2.0-1ubuntu2_amd64.deb
  # sudo apt-get install -f
  # wget http://download.opensuse.org/repositories/home:olav-st/xUbuntu_14.04/Release.key | sudo apt-key add -
  # sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/olav-st/xUbuntu_14.04/ /' > /etc/apt/sources.list.d/screencloud.list"
  # sudo apt-get update ; install_pachages screencloud

  # sudo add-apt-repository -y ppa:nilarimogard/webupd8   #Equalizer for fix audio
  # sudo apt-get update ; install_pachages pulseaudio-equalizer

  # sudo add-apt-repository -y ppa:linrunner/tlp    #save energy
  # sudo apt-get update ; install_pachages tlp tlp-rdw
  # sudo tlp start

  # sudo dpkg --add-architecture i386 ; sudo apt-get update #teamviewer
  # install_pachages libdbus-1-3:i386 libasound2:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libjpeg62:i386 libpng12-0:i386 libsm6:i386 libxdamage1:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 zlib1g:i386 libc6:i386
  # wget http://download.teamviewer.com/download/teamviewer_i386.deb
  # yes | sudo gdebi teamviewer*.deb
  # sudo dpkg --remove-architecture i386
  # cd "$SELF_DIR"
}

finish_fix() {
  sudo apt-get autoremove -y
}

install_docker() {
 curl -fsSL https://get.docker.com -o get-docker.sh
 sudo sh get-docker.sh
 sudo usermod -aG docker ${USER}
 sdocker-compose versionudo systemctl enable docker
 # docker-compose
 sudo apt-get install -y libffi-dev libssl-dev
 sudo apt install -y python3-dev
 sudo apt-get install -y python3 python3-pip python3-testresources

 sudo pip3 install docker-compose
 # python3 -m pip install -IU docker-compose
}

# NOTE WIFI https://oastic.com/posts/how-to-set-up-wifi-on-ubuntu-running-on-the-raspberry-pi-4/
#
# install_vim
# install_fonts
# install_gems
# finish_fix

# Fixed
# install_programs
# With reboot
# install_ruby
# install_zsh
