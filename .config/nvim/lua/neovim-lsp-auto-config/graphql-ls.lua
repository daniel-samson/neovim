function install()
    vim.cmd("npm install -g graphql-language-service-cli")
end

function config()
    require'lspconfig'.graphql.setup{}
end