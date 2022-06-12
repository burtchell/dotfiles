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
