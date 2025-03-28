lvim.plugins = {
  -- Treesitter
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  -- Rust based code minimap
  {
    'wfxr/minimap.vim',
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    config = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
    end,
  },
  -- K9S
  { "hsalem7/nvim-k8s" },
  -- Autoclose HTML tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- GitHub copilot
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
            keymap = {
              accept = "<Tab>"
            }
          }
        })
      end, 100)
    end,
  },
  -- Supermaven
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({})
  --   end,
  -- },
  -- Lazygit
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- Close buffers
  { "kazhala/close-buffers.nvim" },
  {
    "folke/trouble.nvim",
    version = "v3.6.0",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>dd",
        "<cmd>Trouble diagnostics<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },
  -- Telescope recent files
  { "smartpde/telescope-recent-files" },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_message_when_not_committed = ''
      vim.g.gitblame_delay = 1000
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'lervag/vimtex',
    version = "v2.15", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.conceallevel = 1
      vim.g.tex_conceal = 'abdmg'
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = '.texfiles/',
        out_dir = '.texfiles/',
        -- Add this 'options' line to enable shell-escape:
        options = { '-shell-escape' },
      }
      -- Add these lines to explicitly set executable paths:
      vim.g.vimtex_latexmk_engines = {
        pdflatex = '/Users/julian/bin/pdflatex',
        lualatex = '/Users/julian/bin/lualatex',
        xelatex  = '/Users/julian/bin/xelatex',
        latexmk  = '/Users/julian/bin/latexmk',
        bibtex   = '/Users/julian/bin/bibtex',
      }
    end
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["vim.lsp.hover.enabled"] = false,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --       config = {
  --         hover = {
  --           view = "noice",
  --         },
  --       }
  --     },
  --     routes = {
  --       {
  --         filter = {
  --           event = "msg_show",
  --           any = {
  --             { find = "%d+L, %d+B" },
  --             { find = "; after #%d+" },
  --             { find = "; before #%d+" },
  --           },
  --         },
  --         view = "mini",
  --       },
  --     },
  --     presets = {
  --       bottom_search = true,
  --       command_palette = true,
  --       long_message_to_split = true,
  --       inc_rename = true,
  --     },
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  -- TokyoNight color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- KanaGawa color scheme
  {
    'rebelot/kanagawa.nvim'
  },
  {
    'nvim-telescope/telescope.nvim'
  },
  -- Catpuccine color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },
  { 'akinsho/git-conflict.nvim',      version = "*", config = true },
  -- {
  --   'goerz/jupytext.nvim',
  --   version = '0.1.0',
  --   opts = {}, -- see Options
  -- }
}
