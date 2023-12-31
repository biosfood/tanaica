---@type NvPluginSpec[]
local plugins = {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
    "andrewferrier/wrapping.nvim",
    lazy = false,
    config = function()
      require("wrapping").setup({
        softener = { markdown = true },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    config = function()
      vim.cmd "hi link markdownError NONE"
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
}

return plugins
