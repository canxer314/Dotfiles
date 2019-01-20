#!/usr/bin/env zsh

# Vim & Emacs
if exists nvim; then alias vim="$(which nvim)"; fi
alias v="vim"
alias sv="sudo $(which nvim)"
alias e="emacs"
alias ec="emacsclient"
alias se="sudo -E emacs"
alias magit="emacsclient -n -e \(magit-status\)"
alias ke="pkill -SIGUSR2 -i emacs"
alias edebug="emacs --debug-init"
alias etime="emacs --timed-requires --profile"

# ML
alias tb="tensorboard"

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

alias dud="du -hd 1"
alias dua="du -had 1"
if exists ccat; then alias cat="ccat"; fi
if exists hexo; then alias h="hexo"; fi
if exists jupyter; then alias jp='jupyter lab --NotebookApp.iopub_data_rate_limit=10000000'; fi
if exists reveal-md; then
    alias rv='reveal-md --highlight-theme github --theme white --watch'
    alias rvs='reveal-md --highlight-theme github --theme white --static revealjs_output'
fi
if exists asciinema; then alias arec="asciinema rec --max-wait=2"; fi # -t to specify title
if exists screenfetch; then alias sf="screenfetch"; fi
if exists youtube-dl; then
    alias yd='youtube-dl --write-auto-sub --ignore-errors'
    alias yda='youtube-dl --extract-audio --audio-format mp3'
fi
if exists you-get; then alias yg='you-get'; fi
if exists prettier; then
    alias format-all-prettier='prettier --write "**/*.{js,ts,jsx,tsx,json,css,scss,md}';
fi
if exists black; then
    alias format-all-black='black -q **/*.py';
fi
if exists clang-format; then
    alias format-all-clang='fd -e c -e cc -e cpp -e h -e hh -e hpp -x clang-format -i style=file'
fi
if exists cspell; then
    alias cspell-all="cspell --config '$HOME/Dotfiles/cspell.json' '**/*.{js,jsx,ts,tsx,c,cc,cpp,h,hh,hpp,go,json}'"
fi
