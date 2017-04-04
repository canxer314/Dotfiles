" Here are some basic customizations, please refer to the ~/.SpaceVim.d/init.vim
" file for all possible options:
let g:spacevim_default_indent = 3
let g:spacevim_max_column     = 80

" Change the default directory where all miscellaneous persistent files go.
" By default it is ~/.cache/vimfiles/.
let g:spacevim_plugin_bundle_dir = '~/.cache/vimfiles/'

" set SpaceVim colorscheme
let g:spacevim_colorscheme = 'solarized'

" Set plugin manager, you want to use, default is dein.vim
let g:spacevim_plugin_manager = 'dein'  " neobundle or dein or vim-plug

" use space as `<Leader>`
let mapleader = "\<space>"

" Set windows shortcut leader [Window], default is `s`
let g:spacevim_windows_leader = 's'

" Set unite work flow shortcut leader [Unite], default is `f`
let g:spacevim_unite_leader = 'f'

" By default, language specific plugins are not loaded. This can be changed
" with the following, then the plugins for go development will be loaded.
call SpaceVim#layers#load('lang#go')

" loaded ui layer
call SpaceVim#layers#load('ui')

" If there is a particular plugin you don't like, you can define this
" variable to disable them entirely:
let g:spacevim_disabled_plugins=[
    \ ['junegunn/fzf.vim'],
    \ ]

" If you want to add some custom plugins, use these options:
let g:spacevim_custom_plugins = [
    \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
    \ ['wsdjeg/GitHub.vim'],
    \ ]

" set the guifont
let g:spacevim_guifont = 'Roboto\ Mono\ for\ Powerline\ 14'

" set keybinding
:imap jk <Esc>

"emacs keymaping for insert mode cursor movement{{{
nmap <c-a> I<esc> 
nmap <c-e> A<esc>
nmap <c-k> D
inoremap <c-d> <del>
inoremap <c-k> <esc>lC
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-p> <up>
inoremap <c-n> <down>
"}}}