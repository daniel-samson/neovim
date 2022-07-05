function install()
    vim.cmd("npm install -g <language-server>")
end

function config()
    require'lspconfig'.languageServer.setup{}
end