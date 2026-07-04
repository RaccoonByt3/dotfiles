#!/bin/bash

USER="$(whoami)"
GROUP="$(id -gn)"
DIR="/opt/custom"
CURRENT="$(pwd)"

sudo mkdir -p $DIR
sudo chown -R "$USER:$GROUP" $DIR

nvim_f () {
  local APP="nvim"
  echo "------------ Starting with nvim related customization ------------"
  echo "Downloading latest stable neovim version"
  curl -L --output-dir /tmp -O https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  tar -xvzf /tmp/nvim-linux-x86_64.tar.gz -C $DIR
  mv "$DIR/nvim-linux-x86_64" "$DIR/$APP"
  echo "------------ Done downloading and installing latest neovim version ------------"
}

git_f () {
  echo "------------ Starting with git related customization ------------"
  git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
  cat ./git_prompt >> ~/.bashrc
  echo "------------ Done with git related customization ------------"
}

bashmarks_f () {
  local APP="bashmarks"
  echo "------------ Installing bashmarks ------------"
  git clone https://github.com/huyng/bashmarks.git /tmp/$APP
  make -C /tmp/$APP install
  grep -q "bashmarks.sh" ~/.bashrc || {
    echo "" >> ~/.bashrc
    echo "source ~/.local/bin/bashmarks.sh" >> ~/.bashrc
  }
  echo "------------ Finished installing bashmarks ------------"
}

universal_f () {
  echo "------------ Linking custom configurations ------------"
  local DOT_ROOT="$(cd .. && pwd)"
  echo "$DOT_ROOT"
  ln -s "$CURRENT"/tmux.conf "$HOME/.tmux.conf"
  ln -s "$DOT_ROOT/nvim" "$HOME/.config/nvim"
  echo "------------ Finished linking custom configurations ------------"
}

packages_f () {
  sudo apt install tmux
}


universal_f
bashmarks_f
git_f
nvim_f
