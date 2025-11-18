local function augroup(name)
  return vim.api.nvim_create_augroup("owivim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Extra keymap for lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("lsp_attach"),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "Lsp: " .. desc })
    end

    map("gd", vim.lsp.buf.definition, "Goto definition")
    map("gy", vim.lsp.buf.type_definition, "Goto Type definition")
    map("gD", vim.lsp.buf.declaration, "Goto declaration")
    --       -- Some default keymap
    --       -- "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
    --       -- "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
    --       -- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
    --       -- "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
    --       -- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
    --       -- CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
