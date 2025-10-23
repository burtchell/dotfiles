-- open all folds in current window
vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  pattern = "*",
  callback = function()
    vim.wo.foldlevel = 99 -- arbitrary number
  end,
})

-- ensure signcolumn has no background color
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  end,
})

-- hide bufferline in alpha
vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  group = vim.api.nvim_create_augroup("_alpha", { clear = true }),
  callback = function()
    vim.opt.showtabline = 0
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      once = true,
      callback = function()
        vim.opt.showtabline = 2
      end,
    })
  end,
})

-- keep split windows evenly-sized when terminal is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("_auto_resize", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- spellcheck and wrap for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal spell wrap",
})

-- close nvim-tree if it's last buffer open
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd("quit")
    end
  end,
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- show relativenumber in non-insert modes
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

-- turn off relativenumber in insert mode
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      -- Conditional taken from https://github.com/rockyzhang24/dotfiles/commit/03dd14b5d43f812661b88c4660c03d714132abcf
      -- Workaround for https://github.com/neovim/neovim/issues/32068
      if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then
        vim.cmd "redraw"
      end
    end
  end,
})
