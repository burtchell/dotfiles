-- https://github.com/shaunsingh/nord.nvim

local status_ok, nord = pcall(require, "nord")
if not status_ok then
  return
end

vim.g.nord_contrast = false
vim.g.nord_borders = true -- enable border between vertical windows
vim.g.nord_disable_background = false
vim.g.nord_italic = false -- disable italics, which clip in some terminal emulators

nord.set()
