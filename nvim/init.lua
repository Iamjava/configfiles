-- General Settings
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2 

vim.bo.autoindent = true
vim.bo.smartindent = true

vim.opt.number = true
vim.wo.realtivenumer = true

vim.cmd[[colorscheme gruvbox]]
-- Keymappings 

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end
-- EXample.  key_mapper('v', 'jK', '<ESC>')


-- Plugins + Packer install
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end


local lsp = require('lsp-zero')
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()


return require('packer').startup(function()
  use 'wbthomason/packer.nvim' 
  use "folke/tokyonight.nvim" 
  use "ellisonleao/gruvbox.nvim" 
  use "jeffkreeftmeijer/vim-numbertoggle" 
  use "lukas-reineke/indent-blankline.nvim" 
  use  "udalov/kotlin-vim"
  use "nvim-treesitter/nvim-treesitter"
  use {"Shatur/neovim-session-manager",requires ="nvim-lua/plenary.nvim"}
  use "mfussenegger/nvim-lint"
  
  use "nvim-telescope/telescope.nvim"
  use "sheerun/vim-polyglot"
  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/nvim-lsp-installer'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
end)


