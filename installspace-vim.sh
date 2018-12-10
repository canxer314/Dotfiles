#!/bin/bash

# install depency software
# install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# install tmux
# brew install tmux
# install git
# brew install git
# install python2 and 3
# brew install python python3

echo "Remove old files and symlinks"
rm -rf ~/.vimrc ~/.config/nvim ~/.spacevim

echo "Install SpaceVim"
bash <(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)

echo "Install space-vim setting"
rm ~/.spacevim
ln -s ~/Dotfiles/spacevim ~/.spacevim

echo "Install python support for neovim"
python2 -m pip install --user --upgrade neovim
python3 -m pip install --user --upgrade neovim
