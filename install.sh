#!/usr/bin/env bash

UNAME=$(uname)

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

echo "cd to Dotfiles directory..."
cd ~/Dotfiles || exit

echo "Install generatl home dotfiles..."
stow Home

echo "Install zsh..."
stow zsh

if [[ $CURRENT_OS == 'OS X' ]]; then
    echo "Install OSX home dotfiles..."
    stow Home_OSX
elif [[ $CURRENT_OS == 'Linux' ]]; then
    echo "Install Linux home dotfiles..."
    stow Home_Linux
    echo "Install Tilix config..."
    dconf reset -f /com/gexperts/Tilix/
    dconf load /com/gexperts/Tilix/ < ~/.config/tilix/tilix.dconf
fi

if ! [[ -f ~/.gitconfig ]]; then
    echo "Copy gitconfig configurations to HOME..."
    cp ~/Dotfiles/gitconfig ~/.gitconfig
fi

# echo "update submodules"
git submodule init
git submodule update
