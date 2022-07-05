function install()
    vim.cmd("npm i -g vscode-langservers-extracted")
end

function config()
    require'lspconfig'.languageServer.setup{}
    autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require'lspconfig'.eslint.setup{}
    require'lspconfig'.html.setup{}
    require'lspconfig'.jsonls.setup{}
end