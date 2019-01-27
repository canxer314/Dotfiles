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

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Switch projects
function counsel_projectile(){
    projects=("$HOME/Dotfiles" "$HOME/.emacs.d" "$HOME/.doom.d" "$HOME/Dropbox/Developer"
             "$HOME/Dropbox/Snippets")
    developer_root=$HOME/Developer
    for dir in $(find $developer_root -maxdepth 2 -type d); do
        if [ -d $dir/.git ]; then
            projects+=($dir)
        fi
    done

    fzf_projects=""
    for project in $projects; do
        fzf_projects=$fzf_projects\\n$project;
    done
    # Trim first \n
    fzf_projects=${fzf_projects:2:${#fzf_projects}-1}

    selected_project=$(echo $fzf_projects | fzf)
    cd $selected_project
}
alias pp=counsel_projectile
