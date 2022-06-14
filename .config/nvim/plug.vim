" Add plugins, and run :PlugInstall to apply changes
packloadall
call plug#begin()

" Airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" HTML Emmet in vim
Plug 'mattn/emmet-vim'

" surround - nice way to add brackets, quotes, etc. using 's'
Plug 'tpope/vim-surround'

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

" Easier way to comment stuff out - 'gcc' comments, 'gcgc' uncomments
Plug 'tpope/vim-commentary'

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  
  " Nord theme
  Plug 'shaunsingh/nord.nvim'

  " Conquer of Completion - VSCode autocomplete and other features
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  " Note: requires :set termguicolors in init.vim
  Plug 'norcalli/nvim-colorizer.lua'
endif

call plug#end()
