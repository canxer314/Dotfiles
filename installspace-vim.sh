#!/bin/bash

# install depency software
# install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# install tmux
# brew install tmux
# install git
# brew install git

echo "Install SpaceVim"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"

echo "Install space-vim setting"
rm ~/.spacevim
ln -s ~/Dotfiles/.spacevim ~/.spacevim
