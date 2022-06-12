" Set compatablity to Vim only
set nocompatible

set wrap
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

" Add plugins, and run :PlugInstall to apply changes
packloadall
call plug#begin()

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nord theme
Plug 'shaunsingh/nord.nvim'

" Conquer of Completion - VSCode autocomplete and other features
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Prettier plugin
" Note: need to globally install Prettier (via npm) for plugin to take effect
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Git gutter next to line numbers
Plug 'airblade/vim-gitgutter'

" Nerd Tree stuff
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" VSCode-like commenting keyboard shortcut
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Nord theme, set cursor line afterwards
colorscheme nord
set cursorline

" Airline config
let g:airline_theme='nord_minimal'
let g:airline#extensions#whitespace#enabled = 0

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
" ctrl-n to show tree
nmap <C-n> :NERDTreeToggle<CR>

" j/k move through virtual lines (wrapping lines)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Navigate windows (like between tree and editor panel) with Ctrl-[hjkl]
noremap <C-j> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" TODO: figure out how to map toggle comment to C-/
"nmap <C-/> <plug>NerdCommenterToggle
"vmap <C-/> <plug>NerdCommenterToggle
