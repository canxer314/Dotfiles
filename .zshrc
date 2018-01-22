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

# Update bundles with `antigen reset`
source ~/Dotfiles/antigen/antigen.zsh
# call antigen update on your terminal and it will update the oh-my-zsh repository
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#antigen bundle robbyrussell/oh-my-zsh lib/

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# Git plugin
antigen bundle git
antigen bundle git-extras
antigen bundle tig

antigen bundle tmux
antigen bundle command-not-found
antigen bundle autojump
antigen bundle textmate
antigen bundle lein
antigen bundle gulp

# Ruby
antigen bundle ruby
antigen bundle rbenv

antigen bundle pip

# Node plugin
antigen bundle node
antigen bundle npm
antigen bundle nvm
antigen bundle lukechilds/zsh-nvm

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

exists() { type "$1" > /dev/null 2>&1; }

if [[ $CURRENT_OS == 'OS X' ]]; then
    if exists ggrep; then alias grep="ggrep"; fi
    if exists brew; then alias bu='brew upgrade | brew cleanup | brew cask cleanup'; fi

    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
    alias e.="open -a emacs ."
    alias oi="open . -a iterm"
    if [ -d '/Applications/ForkLift.app' ]; then
        alias of="open -a ForkLift ."
    else
        alias of="open ."
    fi
elif [[ $CURRENT_OS == 'Linux' ]]; then
fi

if exists nvim; then alias vim="nvim"; fi
alias v="vim"
alias sv="sudo -E vim"
alias e="emacs"
alias se="sudo -E emacs"
alias ke="pkill -SIGUSR2 -i emacs"
alias edebug="emacs --debug-init"
alias etime="emacs --timed-requires --profile"

# Tmux
if exists antigen; then alias ar="antigen reset"; fi
if exists tmux; then alias t="tmux"; fi
# tmux new-session -s bind to `ts`

if exists python; then alias p="python"; fi
if exists python3; then alias p3="python3"; fi
if exists pipenv; then alias pe="pipenv"; fi

if exists npm; then
    alias ng="npm list -g --depth=0"
    alias nl="npm list --depth=0"
fi

# React Native
if exists react-native; then
    alias rn="react-native"
    alias ri="react-native run-ios"
    alias ra="react-native run-android"
    alias rni="rm -rf ios/build/; kill $(lsof -t -i:8081); react-native run-ios"
    alias rir="react-native run-ios --configuration release --device"
fi

if exists ccat; then alias cat="ccat"; fi
if exists trash; then alias rm="trash"; fi
if exists hexo; then alias h="hexo"; fi
if exists jupyter; then alias jp='jupyter notebook --NotebookApp.iopub_data_rate_limit=10000000'; fi
if exists reveal-md; then alias rv='reveal-md --highlight-theme github --theme simple -w'; fi
if exists asciinema; then alias arec="asciinema rec --max-wait=2"; fi # -t to specify title
if exists screenfetch; then alias sf="screenfetch"; fi
if exists youtube-dl; then alias yd='youtube-dl --write-auto-sub --ignore-errors'; fi
if exists you-get; then alias yg='you-get'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ztlevi/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ztlevi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ztlevi/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ztlevi/google-cloud-sdk/completion.zsh.inc'; fi
