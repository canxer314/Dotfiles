#!/usr/bin/env zsh

if ! [[ $CURRENT_OS == 'Linux' ]]; then
    return
fi

alias xx="xmodmap ~/.Xmodmap_linux"
alias xh="xmodmap ~/.Xmodmap_hhkb"
if exists tilix; then
    alias ot="tilix ."
elif exists konsole; then
    alias ot="konsole"
elif exists gnome-terminal; then
    alias ot="gnome-terminal"
fi
if [ -f "/usr/bin/xdg-open" ];then
    alias oo="/usr/bin/xdg-open . &>/dev/null"
    alias soo="sudo /usr/bin/xdg-open . &>/dev/null"
else
    alias oo="/usr/bin/gvfs-open . &>/dev/null"
    alias soo="sudo /usr/bin/gvfs-open . &>/dev/null"
fi
alias e.="emacsclient ."

# Tilix fix: https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Dump all config: dconf dump / >~/Downloads/user.conf
alias dconf-dump-all="
    dconf dump /com/gexperts/Tilix/ > ~/Dotfiles/Home_Linux/.config/dconf/tilix.conf
    dconf dump /org/gnome/terminal/legacy/ > ~/Dotfiles/Home_Linux/.config/dconf/gnome.conf
    dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > ~/Dotfiles/Home_Linux/.config/dconf/media-keys.conf
    dconf dump /org/gnome/desktop/wm/keybindings/ > ~/Dotfiles/Home_Linux/.config/dconf/wm-keys.conf
    dconf dump /org/gnome/mutter/keybindings/ > ~/Dotfiles/Home_Linux/.config/dconf/mutter-keys.conf
"
alias cnet="sudo route del default gw 0.0.0.0 enp6s0
                sudo ip route add 10.213.37.0/24 via 10.193.35.1 dev enp6s0"


function ppalist() {
    for APT in `find /etc/apt/ -name \*.list`; do
        grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" $APT | while read ENTRY ; do
            CURRENT_USER=`echo $ENTRY | cut -d/ -f4`
            PPA=`echo $ENTRY | cut -d/ -f5`
            echo sudo apt-add-repository ppa:$CURRENT_USER/$PPA
        done
    done
}
