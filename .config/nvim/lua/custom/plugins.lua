local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { overrides.treesitter,
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",
      	"python",
        "bash",
        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "zig"
      },
    },
  },
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist" },
    config = function()
      require "custom.configs.truezen" -- just an example path
    end,
  },

  { "elkowar/yuck.vim" , lazy = false },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
   "nvim-telescope/telescope.nvim",
   opts = {
     defaults = {
       mappings = {
         i = {
           ["<esc>"] = function(...)
               require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
   },

   {
     "folke/which-key.nvim",
     enabled = false,
   },
   {
    "christoomey/vim-tmux-navigator",
    lazy = false,
   },
   {
     "nanotee/sqls.nvim",
      lazy = true,
      config = function()
      vim.g.sql_clib_path = "<path_to_libsqlite3.so>"
    end
   },
  -- codeium is pretty neat!
--  {
--    "Exafunction/codeium.vim",
--    lazy = false
--  },
--   {
--    "github/copilot.vim",
--    lazy = false
--  },
{
  "zbirenbaum/copilot.lua",
  lazy = false,
  cmd = "Copilot",
--  event = "InsertEnter",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
        prev = "<C-j>",
        next = "<M-k>",
        dismiss = "<C-h>",
      },
    },
    panel = {
      enabled = false,
          auto_refresh = false,
      keymap = {
        accept = "<CR>",
        jump_prev = "[[",
        jump_next = "]]",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
    filetypes = {
      markdown = true,
      help = false,
      gitcommit = false,
    },
  },
},
{
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
 --   event = { "InsertEnter", "LspAttach" },
    fix_pairs = true,
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
    end,
  },
--{
--  "zbirenbaum/copilot-cmp",
--  lazy = false,
--  config = function ()
--  require("copilot_cmp").setup()
--  end
--},
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
