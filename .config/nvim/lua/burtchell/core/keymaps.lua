local function map(m, k, v)
  vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- close buffers
map("n", "<C-x>", ":bdelete!<CR>")

-- subsequent indents in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- move text up and down (visual mode)
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- move text up and down (vertical visual mode)
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

vim.keymap.set({ "n", "v", "x" }, "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })
map("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")

--
-- PLUGINS (note: some keymaps are set in plugin configs)
--

map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>")

map("n", "<leader>r", ":RenderMarkdown toggle<CR>")

map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", "<C-t>", "<cmd>Telescope live_grep<cr>")

map("n", "<leader>z", ":ZenMode<CR>")
