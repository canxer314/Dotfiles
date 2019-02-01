export EDITOR=vim
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export MANPATH="/usr/local/man:$MANPATH"

# doom
export PATH="$HOME/.emacs.d/bin:$PATH"

# Sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Rust package manager
export PATH="$HOME/.cargo/bin:$PATH"

# Npm global packages
export PATH=$HOME/.npm-global/bin:$PATH

# Java
if [[ -f /usr/libexec/java_home ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 11`
elif [[ -f /usr/bin/javac ]]; then
    export JAVA_HOME=$(dirname $(dirname $(readlink -e /usr/bin/javac)))
fi
if [[ $JAVA_HOME ]];then
    export JRE_HOME=$JAVA_HOME/jre
    export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
    export PATH=$JAVA_HOME/bin:$PATH
fi

# Python
export PYTHONPATH=$PYTHONPATH:.

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go
if [ -d /usr/local/go ]; then # for non package manager installation
    export PATH=$PATH:/usr/local/go/bin
fi
if [ -f /usr/local/bin/go ]; then
    export GOPATH=$HOME/go
    export GOROOT=$(go env GOROOT)
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    export PATH=$PATH:$HOME/go/bin
fi

# System based environments
if [ -f "$HOME/.zprofile-sys" ]; then
    source "$HOME/.zprofile-sys"
fi

# Anaconda
if [[ $CURRENT_OS == 'OS X' ]]; then
    export PATH=/usr/local/anaconda3/bin:$PATH
else
    export PATH=$HOME/anaconda3/bin:$PATH
fi

# Linuxbrew
if [[ $CURRENT_OS == 'Linux' ]]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi

# Local path has the highest priority
export PATH=$HOME/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH
