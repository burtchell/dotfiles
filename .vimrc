packloadall

" Plugins start here
call plug#begin()

" Prettier plugin
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

" Set compatablity to Vim only
set nocompatible

" Line wrapping
set wrap

" Encoding
set encoding=utf-8

" Set current/relative numbers
set number
set relativenumber 

" Status bar
set laststatus=2

set tabstop=2
set shiftwidth=2
set expandtab
