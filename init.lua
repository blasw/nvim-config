-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    -- Fast movement
    vim.cmd("silent! nunmap <buffer> <S-k>")

    -- Prev suggestion
    --vim.cmd("silent! iunmap <buffer> <C-k>")
    --vim.cmd("set wrap")
  end,
})
