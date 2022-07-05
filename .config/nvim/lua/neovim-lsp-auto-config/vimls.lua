function install()
    vim.cmd("npm install -g vim-language-server")
end

function config()
    require'lspconfig'.vimls.setup{}
end