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

echo "Uninstall generatl home dotfiles..."
stow -D Home

echo "Uninstall zsh..."
stow -D zsh

if [[ $CURRENT_OS == 'OS X' ]]; then
    echo "Uninstall OSX home dotfiles..."
    stow -D Home_OSX
elif [[ $CURRENT_OS == 'Linux' ]]; then
    echo "Uninstall Linux home dotfiles..."
    stow -D Home_Linux
fi

if ! [[ -f ~/.gitconfig ]]; then
    echo "Delate gitconfig configurations from HOME..."
    rm ~/.gitconfig
fi
