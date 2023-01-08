local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "dac4088c70f4337c6c40d1a2751266a324765797" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "95fb27dfcf6330ac482a99545d7440ac6729851b" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "f00eb3b766c370cb34fdabc29c760338ba9e4c6c" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "e89df176e8b38e931b7e71a470f923a317976d86" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4a42b30376c1bd625ab5016c2079631d531d797a" }
  use { "kyazdani42/nvim-web-devicons", commit = "7f55bc36eddec87597167a97de5b690997edaf7d" }
  use { "nvim-tree/nvim-tree.lua", commit = "ccb6d8a518d32e22bf5874f90e6c22661a5d8b46" }
  use { "akinsho/bufferline.nvim", commit = "c7492a76ce8218e3335f027af44930576b561013" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "d8c392dd75778d6258da4e7c55522e94ac389732" }
  use { "akinsho/toggleterm.nvim", commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a" }
  use { "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }
  use { "lewis6991/impatient.nvim", commit = "227d02b37c56d9a8f6456b1017d04d7dc99076d5" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7" }
  use { "goolord/alpha-nvim", commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb" }
  -- use {"folke/which-key.nvim"}
  use { "tiagovla/scope.nvim", commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875" }
  -- use { "notjedi/nvim-rooter.lua", commit = "833e6a37fafb9b2acb6228b9005c680face2a20f" } 

  -- Colorschemes
  use { "folke/tokyonight.nvim", commit = "def91651c41f6d1d43ebcb50763324d35331baee" }
  use { "lunarvim/darkplus.nvim", commit = "1826879d9cb14e5d93cd142d19f02b23840408a6" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "11a95792a5be0f5a40bab5fc5b670e5b1399a939" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }
  use { "hrsh7th/cmp-nvim-lua", commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6" }
  use { "lvimuser/lsp-inlayhints.nvim", commit = "a28c51a6362e3faa17f67749436cb5c8b55dcc6d" }
  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "508b41fb7b2a7f06522f96eb7742d21f025a8512" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "484fb38b8f493ceeebf4e6fc499ebe41e10aae25" } -- a bunch of snippets to use
  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { "neovim/nvim-lspconfig", commit = "41dc4e017395d73af0333705447e858b7db1f75e" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "369d520350b4c1af40630f90c3703444c40c065a" }
  use { "williamboman/mason-lspconfig.nvim", commit = "33a198bc5ee0215ae8ab3f61781b29103cf4ca5a" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "915558963709ea17c5aa246ca1c9786bfee6ddb4" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "04af51dbfb17c2afa0b8d82b0e842e0638201ca9" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "86345612b76c1c441b11be0b16e76e0c136107c6",
  }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "d4f8c01280413919349f5df7daccd0c172143d7c" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "700a3c7d6fbe5b07bee74e9952b456120d355c47" }
  use { "rcarriga/nvim-dap-ui", commit = "f2206de65ea39093e3f13992507fc985c17aa763" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
