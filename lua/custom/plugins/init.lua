-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      scroll = {},
      animate = {
        -- your animate configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      notifier = {},
      gitbrowse = {},
      lazygit = {},
    },
    keys = {
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = 'Git Browse',
        mode = { 'n', 'v' },
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon'):setup()
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<leader>hx', function()
        harpoon:list():add()
      end, { desc = '[h]arpoon [x] marks the spot' })
      vim.keymap.set('n', '<leader>hl', function()
        harpoon:list():next { ui_nav_wrap = true }
      end, { desc = '[h]arpoon next [l] ' })
      vim.keymap.set('n', '<leader>hh', function()
        harpoon:list():prev { ui_nav_wrap = true }
      end, { desc = '[h]arpoon previous [h]' })
      vim.keymap.set('n', '<leader>hm', function()
        toggle_telescope(harpoon:list())
      end, { desc = '[h]arpoon [m]arks' })
    end,
  },

  {
    'Wansmer/treesj',
    keys = {
      { '<leader>m', '<cmd>TSJToggle<cr>' },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('treesj').setup {--[[ your config ]]
      }
    end,
  },
  {
    'ojroques/nvim-bufdel',
    config = function()
      require('bufdel').setup {
        next = 'tabs',
        quit = true, -- quit Neovim when last buffer is closed
      }
      vim.keymap.set('n', '<leader>x', '<cmd>BufDel<CR>', { desc = '[x] out of buffer' })
    end,
  },
  'nvim-lua/plenary.nvim',

  {
    'nvchad/ui',
    lazy = true,
    config = function()
      require 'nvchad'
      vim.keymap.set('n', '<leader>tp', function()
        require('nvchad.themes'):open()
      end, { desc = '[T]eme [p]icker' })
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    opts = function()
      return { override = require 'nvchad.icons.devicons' }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'devicons')
      require('nvim-web-devicons').setup(opts)
    end,
  },

  {
    'nvchad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },

  'nvchad/volt',

  {
    'goolord/alpha-nvim',
    lazy = false,
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'custom.plugins.configs.alpha'
    end,
  },
  {
    -- 'folke/noice.nvim',
    -- event = 'VeryLazy',
    --
    -- keys = {
    --   { '<leader>dn', ':Noice dismiss<cr>', desc = '[N]oice [D]ismiss', silent = true },
    -- },
    -- config = function()
    --   require('noice').setup {
    --     routes = {
    --       {
    --         filter = {
    --           event = 'msg_show',
    --           kind = '',
    --           find = 'written',
    --         },
    --         opts = { skip = true },
    --       },
    --     },
    --   }
    -- end,
    --
    -- opts = {
    --   -- add any options here
    --   lsp = {
    --     hover = {
    --       enabled = false, -- this will disable hover warning
    --     },
    --     signature = {
    --       enabled = false, -- this will disable signtature warning.
    --     },
    --     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --     override = {
    --       ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
    --       ['vim.lsp.util.stylize_markdown'] = true,
    --       ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    --     },
    --   },
    -- },
    -- dependencies = {
    --   -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --   'MunifTanjim/nui.nvim',
    --   -- OPTIONAL:
    --   --   `nvim-notify` is only needed, if you want to use the notification view.
    --   --   If not available, we use `mini` as the fallback
    --   'rcarriga/nvim-notify',
    -- },
  },
  -- needed for mini.ai to get function and tags etc
  'nvim-treesitter/nvim-treesitter-textobjects',

  'tpope/vim-fugitive',
  {
    'nvim-web-devicons',
    override_by_extension = {
      ['tsx'] = {
        icon = '󰜈',
        name = 'react',
      },
      ['jsx'] = {
        icon = '󰜈 ',
        name = 'react',
      },
      ['ts'] = {
        icon = '',
        name = 'react',
      },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      }
    end,
    keys = {
      { '<leader>e', '::NvimTreeFocus <CR>', desc = 'nvimTree focus', silent = true },
      { '<C-n>', ':NvimTreeToggle <CR>', desc = 'nvimTree collapse', silent = true },
    },
  },

  -- assumes ollama is setup
  {
    'robitx/gp.nvim',
    config = function()
      require 'custom.plugins.configs.gp'
    end,
  },
}
