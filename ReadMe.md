# Ting Zhou's Configuration for SpaceVim, Dotfiles and Atom

## Installation

The root directory should be ***~/Dotfiles***

 `git clone https://github.com/ztlevi/Dotfiles.git ~/Dotfiles`

1. SpaceVim

   Install git, vim, curl first.
   Install it with 

   ```shell
   cd ~/Dotfiles
   ./installSpaceVim.sh
   ```
	Update the plugin with `:PlugUpdate`


2. Dotfiles

   Install zsh first, `brew install zsh zsh-completions` or `apt install zsh` on Ubuntu.
   Install oh-my-zsh:
   ```shell
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   ```
   Put the dotfiles in the home directory: 

   ```shell
    cd ~/Dotfiles
    ./install.sh
   ```

3. Atom

   Sync with sync-settings packge.

   1. Create personal access token on github
   2. Copy the GistID

## Mac Keybindings
Settings are described in *Mac_keybindings/ReadMe.md*

## Fonts

1. Roboto Mono for Powerline
2. Ubuntu Mono and the one for Powerline
3. Source Code Pro for Powerline

## Notes
1. Xmodmap file is the key tweak for linux.
2. Fix npm completion permission. https://docs.npmjs.com/getting-started/fixing-npm-permissions .
