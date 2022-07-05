function install()
    vim.cmd("npm install -g dockerfile-language-server-nodejs")
end

function config()
    require'lspconfig'.dockerls.setup{}
end