-- https://github.com/mbbill/undotree

return {
  "mbbill/undotree",

  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", mode = "n", desc = "Toggle Undotree" },
  },

  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_DiffpanelHeight = 15
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
