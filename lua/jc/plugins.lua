local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)

  use "numToStr/Comment.nvim" -- Comment hotkey
  use "wbthomason/packer.nvim" -- Packer manager
  use "nvim-lua/plenary.nvim" -- Package that is required by quite a few plugins

	-- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"

  -- Nvim-Tree
  use "kyazdani42/nvim-tree.lua" -- Tree explorer
  use "nvim-tree/nvim-web-devicons"

	-- Cmp 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'windwp/nvim-autopairs'

	-- Snippets
  use 'L3MON4D3/LuaSnip' -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets' -- Many friendly snippets



	-- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "RRethy/vim-illuminate"

	-- Telescope
  use "nvim-telescope/telescope.nvim"

	-- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "windwp/nvim-ts-autotag"

	-- Git
  -- nvim v0.7.2
  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })
  
  -- Project
  use "ahmedkhalf/project.nvim"
  use "startup-nvim/startup.nvim"

  -- Terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
