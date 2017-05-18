alias g="git"
alias cl="clear"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set the global node modules path to /usr/local/bin
# Fix permissions using: sudo chown -R $(whoami) /usr/local 
export npm_config_prefix=/usr/local

export EDITOR=vim

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export MANPATH="/usr/local/man:$MANPATH"
