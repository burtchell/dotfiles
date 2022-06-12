packloadall

" Plugins start here
" Add plugins, and run :PlugInstall to apply changes
call plug#begin()

" Nord theme
Plug 'arcticicestudio/nord-vim'

" Prettier plugin
" Note: need to globally install Prettier (via npm) for plugin to take effect
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

" 2 space tabs
set tabstop=2
set shiftwidth=2
set expandtab

" color theming
colorscheme nord
set cursorline

" Ignore case of searches
set ignorecase

" Enable mouse in all modes
set mouse=a

" Offset to keep cursor from edges of screen
set scrolloff=6
