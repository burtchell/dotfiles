" Initialization and configuration for nvim
" Plugins and keymaps are imported.

" Imports
runtime ./plug.vim
runtime ./keymaps.vim

" Set compatablity to Vim only
set nocompatible

" set wrap
set encoding=utf-8
set mouse=a

" Set current/relative numbers
set number
set relativenumber

" Status bar
set laststatus=2

" 2 space tabs
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

" Ignore case of searches
set ignorecase

" Offset to keep cursor from edges of screen
set scrolloff=6

" Nord theme, set cursor line afterwards
colorscheme nord
set cursorline

" Airline config
let g:airline_theme='nord_minimal'
let g:airline#extensions#whitespace#enabled = 0 
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' ' 

" CoC config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-html',
  \ 'coc-css'
  \ ]

" Prettier config
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
let g:prettier#autoformat = 1

" Nerd tree config
let g:NERDTreeWinPos = "right"
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'~',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'~',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
