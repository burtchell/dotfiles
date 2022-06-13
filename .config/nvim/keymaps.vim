" Keymaps

" Leave insert mode with two semicolons
:imap ;; <Esc>

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

" Emmet-vim
let g:user_emmet_mode='n' " Normal mode only
let g:user_emmet_leader_key=',' " ,, to apply emmet

" TODO: figure out how to map toggle comment to C-/
"nmap <C-/> <plug>NerdCommenterToggle
"vmap <C-/> <plug>NerdCommenterToggle
