-- https://github.com/hrsh7th/nvim-cmp

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",           -- source for text in buffer
    "hrsh7th/cmp-path",             -- source for file system paths
    "L3MON4D3/LuaSnip",             -- snippet engine
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",         -- vs-code like pictograms
    "hrsh7th/cmp-cmdline",
    "dmitmel/cmp-cmdline-history",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      matching = {
        disallow_fuzzy_matching = false, -- allow fuzzy matching
      },
      snippet = {                        -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion (https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources)
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({
        { name = "cmdline" },
        { name = "cmdline_history" },
      }),
    })

    cmp.setup.cmdline("/", {
      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "cmdline_history" },
      }),
    })
  end,

}
