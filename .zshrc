export LANG='en_US.UTF-8'
export LC_ALL="en_US.UTF-8"
export TERM="xterm-256color"

# disable C-d close window
set -o ignoreeof

source $ZSH/oh-my-zsh.sh

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

# Source NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Update bundles with `antigen reset`
source ~/Dotfiles/antigen/antigen.zsh
# call antigen update on your terminal and it will update the oh-my-zsh repository
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#antigen bundle robbyrussell/oh-my-zsh lib/

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle tmux
antigen bundle ruby
antigen bundle autojump
antigen bundle textmate
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle gulp
antigen bundle node
antigen bundle npm
antigen bundle nvm
antigen bundle bower
antigen bundle Vifon/deer
antigen bundle zsh-users/zsh-completions

# Syntax highlighting bundle.
# don't enable this theme, it doesn't work well with ansi-term in emacs
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme candy
antigen theme bureau
# antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    elif [[ $DISTRO == 'Arch' ]]; then
        antigen bundle archlinux
    elif [[ $DISTRO == 'Ubuntu' ]]; then
        antigen bundle debian
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

# User configuration

if [[ $CURRENT_OS == 'OS X' ]]; then
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
    alias oi="open . -a iterm"
    if [ -d '/Applications/ForkLift.app' ]; then
        alias of="open -a ForkLift ."
    else
        alias of="open ."
    fi
elif [[ $CURRENT_OS == 'Linux' ]]; then
fi

alias vim="nvim"
alias v="vim"
alias sv="sudo -E vim"
alias e="emacs"
alias e.="open -a emacs ."
alias se="sudo -E emacs"
alias ke="pkill -SIGUSR2 -i emacs"
alias edebug="emacs --debug-init"
alias etime="emacs --timed-requires --profile"
alias rn="react-native"
alias t="tmux"
alias p="python"
alias p3="python3"
alias arec="asciinema rec --max-wait=2" # -t to specify title
alias h="hexo"
alias ng="npm list -g --depth=0"
alias nl="npm list --depth=0"
alias rm='trash'
alias sf='screenfetch'
alias bu='brew upgrade | brew cleanup | brew cask cleanup'
alias rv='reveal-md --highlight-theme github --theme simple -w'
alias yd='youtube-dl --write-auto-sub'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
