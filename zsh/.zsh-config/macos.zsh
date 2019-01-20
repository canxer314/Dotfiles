#!/usr/bin/env zsh

if ! [[ $CURRENT_OS == 'OS X' ]]; then
    return
fi

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
alias ot="iterm-new-tab"
if [ -d '/Applications/ForkLift.app' ]; then
    alias oo="open -a ForkLift ."
    alias soo="sudo open -a ForkLift ."
else
    alias oo="sudo open ."
fi
alias stat="stat -x"
alias nt="nettop -cdP"
alias mac=~/Dotfiles/ezmacsync/ezmacsync.py


function iterm-new-tab () {
    local cdto="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

    osascript -i <<EOF
        tell application "iTerm2"
            activate
            tell current window
                create tab with default profile
                tell the current session
                    write text "cd \"$cdto\" $args"
                end tell
            end tell
        end tell
EOF
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
