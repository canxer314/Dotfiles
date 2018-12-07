export LANG='en_US.UTF-8'
export LC_ALL="en_US.UTF-8"
export TERM="xterm-256color"

# disable C-d close window
set -o ignoreeof

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

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
antigen bundle tig

antigen bundle tmux
antigen bundle heroku
antigen bundle command-not-found
antigen bundle autojump
antigen bundle textmate
antigen bundle lein
antigen bundle gulp

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

# OS setting
if [[ $CURRENT_OS == 'OS X' ]]; then
    if exists ggrep; then alias grep="ggrep"; fi
    if exists brew; then alias bu='brew upgrade | brew cleanup | brew cask cleanup'; fi

    # Emacs-plus
    if [ -d '/usr/local/opt/emacs-plus' ]; then
        export PATH=/usr/local/opt/emacs-plus/bin:$PATH
    # Emacs-mac
    else
        export PATH=/usr/local/opt/emacs-mac/bin:$PATH
    fi
    if [ -d /Applications/Emacs.app ]; then
        alias emacs=/Applications/Emacs.app/Contents/MacOS/emacs
    fi
    alias e.="open -a emacs ."
    alias ot="open -a iterm ."
    if [ -d '/Applications/ForkLift.app' ]; then
        alias oo="open -a ForkLift ."
        alias soo="sudo open -a ForkLift ."
    else
        alias oo="sudo open ."
    fi
    alias stat="stat -x"
elif [[ $CURRENT_OS == 'Linux' ]]; then
    alias xx="xmodmap ~/.Xmodmap"
    alias xh="xmodmap ~/Dotfiles/Xmodmap_hhkb"
    if exists terminator; then
        alias ot="terminator --new-tab ."
    else if exists konsole; then
        alias ot="konsole --new-tab ."
    else if exists gnome-terminal; then
        alias ot="gnome-terminal --tab --working-directory='.'"
    fi
    if [ -f "/usr/bin/xdg-open" ];then
        alias oo="/usr/bin/xdg-open . &>/dev/null"
        alias soo="sudo /usr/bin/xdg-open . &>/dev/null"
    else
        alias oo="/usr/bin/gvfs-open . &>/dev/null"
        alias soo="sudo /usr/bin/gvfs-open . &>/dev/null"
    fi
    alias e.="emacsclient ."
fi

# Vim & Emacs
if exists nvim; then alias vim="nvim"; fi
alias v="vim"
alias sv="sudo nvim"
alias e="emacs"
alias ec="emacsclient"
alias se="sudo -E emacs"
alias magit="emacsclient -n -e \(magit-status\)"
alias ke="pkill -SIGUSR2 -i emacs"
alias edebug="emacs --debug-init"
alias etime="emacs --timed-requires --profile"

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

if exists code; then alias c.="code ."; fi

# Tmux
if exists antigen; then alias ar="antigen reset"; fi
if exists tmux; then alias t="tmux"; fi
# tmux new-session -s bind to `ts`

if exists python; then alias p="python"; fi
if exists python3; then alias p3="python3"; fi
if exists pipenv; then alias pe="pipenv"; fi
if exists pip3; then alias pip="noglob pip3"; fi
alias sa="source activate"
alias sd="source deactivate"

if exists npm; then
    alias npmgL0="npm list -g --depth=0"
fi

if exists ccat; then alias cat="ccat"; fi
if exists hexo; then alias h="hexo"; fi
if exists jupyter; then alias jp='jupyter lab --NotebookApp.iopub_data_rate_limit=10000000'; fi
if exists reveal-md; then
    alias rv='reveal-md --highlight-theme github --theme white --watch'
    alias rvs='reveal-md --highlight-theme github --theme white --static revealjs_output'
fi
if exists asciinema; then alias arec="asciinema rec --max-wait=2"; fi # -t to specify title
if exists screenfetch; then alias sf="screenfetch"; fi
if exists youtube-dl; then alias yd='youtube-dl --write-auto-sub --ignore-errors'; fi
if exists you-get; then alias yg='you-get'; fi
if exists prettier; then
    alias format-all-prettier='prettier --write "**/*.{js,ts,jsx,tsx,json,css,scss,md}';
fi
if exists black; then
    alias format-all-black='black -q **/*.py';
fi
if exists clang-format; then
    alias format-all-clang='clang-format -i -style=file *.c *.cc *.cpp *.h *.hh *.hpp';
fi
if exists cspell; then
    alias cspell-all="cspell --config '$HOME/Dotfiles/cspell.json' '**/*.{js,jsx,ts,tsx,c,cc,cpp,h,hh,hpp,go,json}'"
fi
alias mac=~/Dotfiles/ezmacsync/ezmacsync.py

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -f '/Users/ztlevi/torch/install/bin/torch-activate' ]; then
    . /Users/ztlevi/torch/install/bin/torch-activate
fi
