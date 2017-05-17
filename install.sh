#!/bin/bash

# install depency software
# install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# install tmux
# brew install tmux
# install git
# brew install git

UNAME=`uname`

# Fallback info
CURRENT_OS='Linux'
DISTRO=''
VER=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Determine Linux distro
    DISTRO=$(lsb_release -si)
    VER=$(lsb_release -sr)
fi

echo "cd to Dotfiles directory"
cd ~/Dotfiles

echo "Install eslint configurations..."
rm ~/.eslintrc
ln -s ~/Dotfiles/.eslintrc ~/.eslintrc

echo "Install eslint configurations..."
rm ~/.pylintrc
ln -s ~/Dotfiles/.pylintrc ~/.pylintrc

echo "Install ctags configurations..."
rm ~/.ctags
ln -s ~/Dotfiles/.ctags ~/.ctags

echo "Install gitconfig configurations..."
rm ~/.gitconfig
ln -s ~/Dotfiles/.gitconfig ~/.gitconfig

echo "Install jsbeautify configurations..."
rm ~/.jsbeautifyrc
ln -s ~/Dotfiles/.jsbeautifyrc ~/.jsbeautifyrc

echo "Install zsh configurations..."
rm ~/.zshrc
rm ~/.zprofile
ln -s ~/Dotfiles/.zshrc ~/.zshrc
ln -s ~/Dotfiles/.zprofile ~/.zprofile

echo "Install tmux setting"
rm ~/.tmux.conf
ln -s ~/Dotfiles/.tmux.conf ~/.tmux.conf

if [[ $CURRENT_OS == 'OS X' ]]; then
    echo "OS X configurations here!"
elif [[ $CURRENT_OS == 'Linux' ]]; then
    echo "Linux configurations here!"
    echo "Install Xmodmap key tweak for linux"
    rm ~/.Xmodmap
    ln -s ~/Dotfiles/.Xmodmap ~/.Xmodmap
fi

# echo "update submodules"
git submodule init
git submodule update
