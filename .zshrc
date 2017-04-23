export LANG='en_US.UTF-8'
export LC_ALL="en_US.UTF-8"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


source $ZSH/oh-my-zsh.sh

UNAME=`uname`

# Fallback info
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Must be Linux, determine distro
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Ubuntu?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='Ubuntu'
        fi
    fi
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source ~/Dotfiles/antigen/antigen.zsh
# call antigen update on your terminal and it will update the oh-my-zsh repository
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#antigen bundle robbyrussell/oh-my-zsh lib/

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle tmuxinator
antigen bundle osx
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

# Syntax highlighting bundle.
# don't enable this theme, it doesn't work well with ansi-term in emacs
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster
#antigen theme candy

if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

# Tell antigen that you're done.
antigen apply

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

if [[ $CURRENT_OS == 'OS X' ]]; then
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
    alias vim="/usr/local/bin/vim"
elif [[ $CURRENT_OS == 'Linux' ]]; then
    alias emacs="/usr/bin/emacs"
    alias xampp="sudo /opt/lampp/lampp"
    alias lampp="sudo /opt/lampp/lampp"
    alias eclipse="sudo /Applications/eclipse/eclipse"
fi    

alias v="vim"
alias sv="sudo vim"
alias e="emacs"
alias se="sudo emacs"
alias ke="pkill -SIGUSR2 -i emacs"
alias edebug="emacs --debug-init"
alias etime="emacs --timed-requires --profile"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $CURRENT_OS == 'OS X' ]]; then
    
elif [[ $CURRENT_OS == 'Linux' ]]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    NPM_CONFIG_PREFIX=~/.npm-global   
fi
