return {
  -- {
  --   "bluz71/vim-moonfly-colors",
  --   name = "moonfly",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.moonflyCursorColor = true
  --     vim.g.moonflyTransparent = true
  --     vim.g.moonflyVirtualTextColor = true
  --     vim.cmd.colorscheme("moonfly")
  --   end,
  -- },
  {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    config = function()
      require("evergarden").setup({
        theme = {
          variant = "winter",
          accent = "green",
        },
        editor = {
          transparent_background = true,
          override_terminal = true,
          sign = {
            color = "none",
          },
          float = {
            color = "mantle",
            invert_border = false,
          },
          completion = {
            color = "surface0",
          },
        },
        integrations = {
          blink_cmp = true,
          gitsigns = true,
          telescope = true,
        },
        cache = true,
        style = {
          tabline = { "reverse" },
          search = { "italic", "reverse" },
          incsearch = { "italic", "reverse" },
          types = { "italic" },
          keyword = { "italic" },
          comment = { "italic" },
          spell = {},
        },
      })
      vim.cmd.colorscheme("evergarden")
    end,
  },
}
