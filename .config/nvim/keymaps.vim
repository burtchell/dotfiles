" Keymaps

" Set space as leader key
let mapleader = ' '

" Leave insert mode with two semicolons
imap ;; <Esc>

" Navigate windows (like between tree and editor panel) with Ctrl-[hjkl]
noremap <C-j> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" ctrl-p telescope
nnoremap <C-p> :lua require'telescope.builtin'.find_files{ hidden = true }<cr>

" ctrl-n to show tree
nmap <C-n> :NERDTreeToggle<CR>

" j/k move through virtual lines (wrapping lines)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Emmet-vim
let g:user_emmet_mode='n' " Normal mode only
let g:user_emmet_leader_key=',' " ,, to apply emmet
