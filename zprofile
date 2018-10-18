# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export PATH="/usr/local/sbin:$PATH"

# doom
export PATH="$HOME/.emacs.d/bin:$PATH"

# Sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Rust package manager
export PATH="$HOME/.cargo/bin:$PATH"

# Npm global packages
export PATH=~/.npm-global/bin:$PATH

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$PATH

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$HOME/go/bin

export EDITOR=vim

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export MANPATH="/usr/local/man:$MANPATH"

# for Remacs
# https://github.com/Wilfred/remacs#requirements
export PATH="/usr/local/opt/texinfo/bin:$PATH"

# System based environments
if [ -f "$HOME/Dotfiles/zprofile-sys" ]; then
    source "$HOME/Dotfiles/zprofile-sys"
fi
