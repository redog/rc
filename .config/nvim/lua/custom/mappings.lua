---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  i = {
   ["<C-l>"] = { [[<Cmd>Copilot suggestion accept<CR>]], "accept copilot suggestion", opts = { silent = true, expr = false } },
   ["<C-j>"] = { [[<Cmd>Copilot suggestion next<CR>]], "next copilot suggestion", opts = { silent = true, expr = false } },
   ["<C-k>"] = { [[<Cmd>Copilot suggestion prev<CR>]], "previous copilot suggestion", opts = { silent = true, expr = false } },
   ["<C-h>"] = { [[<Cmd>Copilot suggestion dismiss<CR>]], "dismiss `copilot suggestion", opts = { silent = true, expr = false } },
  },
}

-- more keybinds!

return M
