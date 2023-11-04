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
  -- OMG QUIT AUOTO COMMENTING
  vim.cmd([[autocmd FileType * set formatoptions-=ro]])
  -- toggle lines for copying
  vim.api.nvim_set_keymap('n', '<Leader>i', ':IndentBlanklineToggle<CR>', { noremap = true, silent = true })

  -- toggle git bar and 
  local signcolumn_status = true -- flag to hold the current state

  -- Function to toggle the sign column
  function toggle_signcolumn()
    if signcolumn_status then
      vim.wo.signcolumn = "no"
    else
      vim.wo.signcolumn = "yes"
    end
    signcolumn_status = not signcolumn_status
  end
  -- Mapping to toggle the sign column with leader + g
  vim.api.nvim_set_keymap('n', '<leader>g', [[<Cmd>lua toggle_signcolumn()<CR>]], { noremap = true, silent = true })


  vim.opt.background = 'dark'
  -- Requires +termguicolors 
  vim.opt.termguicolors = true
end
