function install()
    vim.cmd("npm install -g typescript typescript-language-server")
end

function config()
    require'lspconfig'.tsserver.setup{}
end