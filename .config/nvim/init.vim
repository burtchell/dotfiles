" Initialization and configuration for nvim
" Plugins and keymaps are imported in the following section.
" Any files in ~/.congig/nvim/after/ will be sourced after this file.

" Imports -----------------------------------------------------------
runtime ./plug.vim
runtime ./keymaps.vim

" Vanilla Vim configs -----------------------------------------------

" Set compatablity to Vim only
set nocompatible

" Source local .vimrc when running 'nvim .'
set exrc
set secure

" Color scheme, draw cursor line according to theme afterwards
set termguicolors
colorscheme nord
set cursorline

" Misc.
set nowrap
set encoding=utf-8
set mouse=a
set noerrorbells
set colorcolumn=80
set signcolumn=yes

" Line numbers
set number
set relativenumber

" Default 2 space tabs
set smarttab
set cindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

" Better case sensitivity for searches
set ignorecase
set smartcase

" Offset to keep cursor from edges of screen
set scrolloff=8

" Plugin configs -----------------------------------------------------
" TODO: put all of these files in their own ./after/plugin/[pluginname].rc.vim

" Airline
let g:airline_theme='nord_minimal'
let g:airline#extensions#whitespace#enabled = 0 
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' ' 

" CoC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier', 
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json', 
  \ 'coc-html',
  \ 'coc-htmlhint',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html-css-support',
  \ 'coc-yaml',
  \ ]

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:prettier#autoformat = 1

" NERDTree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden = 1
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

" colorizer.lua
lua << EOF
require'colorizer'.setup()
EOF
