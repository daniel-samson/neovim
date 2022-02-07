vim.g.mapleader = '\\'
require('neovim-modern-text-editing')

-- package manager
require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    "neovim/nvim-lspconfig";          -- Mind the semi-colons
    "hrsh7th/nvim-compe";

}