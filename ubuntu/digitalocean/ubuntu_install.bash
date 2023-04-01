SELF_DIR=`realpath $(dirname $0)`
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
  install_pachages neovim
  install_pachages python-neovim python3-neovim python-pip python3-pip python-pip python-dev python3-dev

  pip3 install --upgrade neovim
  pip install --upgrade neovim

  pip3 install --upgrade pynvim
  pip install --upgrade pynvim

  pip3 install --upgrade msgpack
  pip install --upgrade msgpack

  sudo add-apt-repository ppa:x4121/ripgrep
  sudo apt-get update
  install_pachages ripgrep

  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mkdir -p $HOME/.vim
  ln -vsf "$ROOT_DIR/vim/vimrc" "$HOME/.vimrc"
  ln -vsf "$ROOT_DIR/vim/vim/colors" "$HOME/.vim"
  ln -vsf "$ROOT_DIR/vim/vim/modules" "$HOME/.vim"
  ln -vsf "$ROOT_DIR/vim/vim/syntax" "$HOME/.vim"
  cp -r "$ROOT_DIR/vim/vim/autoload" "$HOME/.vim"
  cp -r "$ROOT_DIR/vim/vim/tmp" "$HOME/.vim"

  mkdir ~/.config
  ln -s ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
  yes | vim +PlugInstall +qa
  nvim +PlugUpdate +qa
  nvim +UpdateRemotePlugins +qa
}

install_zsh() {
  install_pachages zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  mkdir -p "$HOME/.zsh"
  ln -vsf "$ROOT_DIR/zsh/digitalocean/zshrc" "$HOME/.zshrc"
  ln -vsf "$ROOT_DIR/zsh/aliases.zsh" "$HOME/.zsh/aliases.zsh"

  chsh -s `which zsh`
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
 sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose
}

install_nvim() {
  mkdir -p ~/.config/nvim
  ln -vsf "$ROOT_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
  ln -vsf "$ROOT_DIR/nvim/lua" "$HOME/.config/nvim/lua"
  mkdir -p "$HOME/.config/nvim/tmp/backup"

  nvim +PlugUpdate +qa
}

install_nvim

# install_docker
# install_vim
# install_zsh
