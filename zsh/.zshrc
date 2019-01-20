export LANG='en_US.UTF-8'
export LC_ALL="en_US.UTF-8"
export TERM="xterm-256color"

# disable C-d close window
set -o ignoreeof

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# exists: check the executable exists or not
function exists() {
    type "$1" > /dev/null 2>&1;
}

# Ranger
if [ -d "$HOME/.zsh-config" ]; then
    for file in $HOME/.zsh-config/*.zsh; do
        source "$file"
    done
    bindkey '^o' widget-ranger-cd
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
