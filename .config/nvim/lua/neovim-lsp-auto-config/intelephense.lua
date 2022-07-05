function install()
    vim.cmd("npm install -g intelephense")
end

function config()
    require'lspconfig'.intelephense.setup{}
end