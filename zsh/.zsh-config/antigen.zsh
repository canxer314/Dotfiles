#!/usr/bin/env zsh

# call `antigen update` on your terminal and it will update the oh-my-zsh repository
# Update bundles with `antigen reset`
source ~/Dotfiles/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#antigen bundle robbyrussell/oh-my-zsh lib/

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# Git plugin
antigen bundle git
antigen bundle git-extras
antigen bundle gitignore
antigen bundle tig

antigen bundle tmux
antigen bundle tmux-cssh
antigen bundle heroku
antigen bundle command-not-found
antigen bundle autojump
antigen bundle textmate
antigen bundle lein
antigen bundle gulp
antigen bundle rsync
antigen bundle dotenv

# Ruby
antigen bundle ruby
antigen bundle rbenv

# Python
antigen bundle python
antigen bundle pip
antigen bundle django

# Node plugin
antigen bundle node
antigen bundle npm
antigen bundle nvm
antigen bundle lukechilds/zsh-nvm
antigen bundle react-native

# ZSH
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle bower
antigen bundle Vifon/deer
antigen bundle soimort/you-get

# Load the theme.
# antigen theme bureau
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
# antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    elif [[ $DISTRO == 'Arch' ]]; then
        antigen bundle archlinux
    elif [[ $DISTRO == 'Ubuntu' ]]; then
        antigen bundle ubuntu
    fi

elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

# Tell antigen that you're done.
antigen apply

# deer - file navigation for zsh setup
autoload -U deer
zle -N deer
bindkey '\ek' deer # shortcut is Alt-k

