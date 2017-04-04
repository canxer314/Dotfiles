#!/bin/bash

# install depency software
# install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# install tmux
# brew install tmux
# install git
# brew install git

echo "Remove vim configurations..."
rm ~/.vimrc
rm ~/.gvimrc

echo "Create .SpaceVim.d folder and init.vim"
mkdir ~/.SpaceVim.d
ln -s ~/Dotfiles/init.vim ~/.SpaceVim.d/init.vim

echo "Install SpaceVim"
curl -sLf https://spacevim.org/install.sh | bash
