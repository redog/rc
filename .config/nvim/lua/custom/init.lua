if vim.g.vscode then
    -- VSCode extension
  vim.keymap.set("n","u","<Cmd>call VSCodeNotify('undo')<CR>")
  vim.keymap.set("n","U","<Cmd>call VSCodeNotify('redo')<CR>")
else
    -- ordinary Neovim
  vim.api.nvim_set_keymap('v', '<LeftRelease>', '"*ygv', { noremap = true, silent = true })

end
