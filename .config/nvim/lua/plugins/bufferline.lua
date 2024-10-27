return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    opts = {
      options = {
      -- stylua: ignore
      -- close_command = function(n) LazyVim.ui.bufremove(n) end,
      -- stylua: ignore
      -- right_mouse_command = function(n) LazyVim.ui.bufremove(n) end,
      diagnostics = false,
        always_show_bufferline = true,
        -- diagnostics_indicator = function(_, _, diag)
        --   local icons = LazyVim.config.icons.diagnostics
        --   local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        --     .. (diag.warning and icons.Warn .. diag.warning or "")
        --   return vim.trim(ret)
        -- end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        ------@param opts bufferline.IconFetcherOpts
        ---get_element_icon = function(opts)
        ---  return LazyVim.config.icons.ft[opts.filetype]
        ---end,
      },
    },
  },
}
