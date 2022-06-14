" nvim-telescope/telescope.nvim

" ctrl-p telescope
nnoremap <silent> <C-p> :lua require'telescope.builtin'.find_files{}<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        [";;"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--ignore", "-L", "--hidden", "--files" },
    }
  }
}
EOF
