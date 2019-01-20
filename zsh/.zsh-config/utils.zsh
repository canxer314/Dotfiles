#!/usr/bin/env zsh

function use-doom(){
    if [ -d "$HOME/.emacs.d-doom" ];then
        mv ~/.emacs.d ~/.emacs.d-spacemacs && mv ~/.emacs.d-doom ~/.emacs.d;
    else
        echo "~/.emacs.d-doom does not exist, use doom failed."
    fi
}
function use-spacemacs(){
    if [ -d "$HOME/.emacs.d-spacemacs" ];then
        mv ~/.emacs.d ~/.emacs.d-doom && mv ~/.emacs.d-spacemacs ~/.emacs.d;
    else
        echo "~/.emacs.d-spacemacs does not exist, use spacemacs failed."
    fi
}

function update_git_repo() {
    LASTDIR=`pwd`
    echo "Update my Doom Emacs repo"
    cd ~/.doom.d/ && git pull
    echo "Update my Dotfiles repo"
    cd ~/Dotfiles/ && git pull
    ./install.sh > /dev/null
    cd $LASTDIR
}
alias uu='update_git_repo'

function reload_source() {
    LASTDIR=`pwd`
    source ~/.zprofile
    source ~/.zshenv
    source ~/.zshrc
    cd $LASTDIR
    zsh --login
}
alias rr='reload_source'
