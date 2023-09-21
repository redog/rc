-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
if vim.g.vscode then
    -- VSCode extension
  vim.keymap.set("n","u","<Cmd>call VSCodeNotify('undo')<CR>")
  vim.keymap.set("n","U","<Cmd>call VSCodeNotify('redo')<CR>")
else
    -- ordinary Neovim
  vim.api.nvim_set_keymap('v', '<LeftRelease>', '"*ygv', { noremap = true, silent = true })
  -- already default? 
  --  vim.api.nvim_set_keymap('n', '<C-r>', ':history-search-backward<CR>', { noremap = true, silent = true })
  vim.o.mouse = "v"
  vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true, silent = true})
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
end
