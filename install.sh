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

    echo "Dconf load Tilix config..."
    dconf reset -f /com/gexperts/Tilix/
    dconf load /com/gexperts/Tilix/ < ~/.config/dconf/tilix.conf

    echo "Dconf load Gnome terminal config..."
    dconf reset -f /org/gnome/terminal/legacy/
    dconf load /org/gnome/terminal/legacy/ < ~/.config/dconf/gnome.conf

    echo "Dconf load Gnome keybindings..."
    dconf reset -f /org/gnome/settings-daemon/plugins/media-keys/
    dconf load /org/gnome/settings-daemon/plugins/media-keys/ < ~/.config/dconf/media-keys.conf
    dconf reset -f /org/gnome/desktop/wm/keybindings/
    dconf load /org/gnome/desktop/wm/keybindings/ < ~/.config/dconf/wm-keys.conf
    dconf reset -f /org/gnome/mutter/keybindings/
    dconf load /org/gnome/mutter/keybindings/ < ~/.config/dconf/mutter-keys.conf
fi
