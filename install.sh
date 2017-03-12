#!/bin/bash

# install depency software
# install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# install tmux
# brew install tmux
#install git 
#brew install git

echo "cd to Dotfiles directory"
cd ~/Dotfiles

echo "Install vim configurations..."
rm ~/.vimrc
rm ~/.gvimrc
ln -s ~/Dotfiles/.vimrc ~/.vimrc
ln -s ~/Dotfiles/.vimrc ~/.gvimrc

echo "Install eslint configurations..."
rm ~/.eslintrc
ln -s ~/Dotfiles/.eslintrc ~/.eslintrc

echo "Install gitconfig configurations..."
rm ~/.gitconfig
ln -s ~/Dotfiles/.gitconfig ~/.gitconfig

echo "Install jsbeautify configurations..."
rm ~/.jsbeautifyrc
ln -s ~/Dotfiles/.jsbeautifyrc ~/.jsbeautifyrc

echo "Install zsh configurations..."
rm ~/.zshrc
ln -s ~/Dotfiles/.zshrc ~/.zshrc

echo "cd to ~/Dotfiles/Atom"
cd ~/Dotfiles/Atom

echo "Install Atom config and keymap"
rm ~/.atom/config.cson
rm ~/.atom/keymap.cson
ln -s ~/Dotfiles/Atom/config.cson ~/.atom/config.cson
ln -s ~/Dotfiles/Atom/keymap.cson ~/.atom/keymap.cson

#echo "update submodules"
git submodule init
git submodule update
