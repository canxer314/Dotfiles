export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="/usr/local/sbin:$PATH"

# doom
export PATH="$HOME/.emacs.d/bin:$PATH"

# Sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Rust package manager
export PATH="$HOME/.cargo/bin:$PATH"

# Npm global packages
export PATH=$HOME/.npm-global/bin:$PATH

# Anaconda
export PATH=/usr/local/anaconda3/bin:"$PATH"

# Java
if [[ -f /usr/libexec/java_home ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
elif [[ -f /usr/bin/javac ]]; then
    export JAVA_HOME=$(dirname $(dirname $(readlink -e /usr/bin/javac)))
else
    export JAVA_HOME=''
fi
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

# Zlib flags
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

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

# Linuxbrew
if [[ $DISTRO == 'Ubuntu' ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi
