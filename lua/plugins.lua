local packer_repo_url = 'https://github.com/wbthomason/packer.vim'
local install_path = vim.fn.stdpath('data')..'site/pack/packer/start/pack.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    packer_repo_url,
    install_path
  })
end

vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  
  use 'wbthomason/packer.nvim'
  use 'alaviss/nim.nvim'
  use 'mhartington/formatter.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-telescope/telescope.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'David-Kunz/treesitter-unit'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'David-Kunz/cmp-npm'
  use 'marko-cerovac/material.nvim'
  use 'mfussenegger/nvim-dap'
  use 'L3M0N4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'vo1dikss/vim-floaterm'
  use 'nvim-telescope/telescope-ui-select.nvim'
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)

