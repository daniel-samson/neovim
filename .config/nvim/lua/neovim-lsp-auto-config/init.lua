--[[
-- Automatically installs language servers and configures them
--]]

local vimls = require'vimls';
local tsserver = require'tsserver';
local vsCodeLangServersExtracted = require'vscode-langservers-extracted';
local intelephense = require'intelephense'
local graphql = require'graphql'
local dockerls = require'dockerls'

function install()
    -- @todo check if server is installed for each plugin
    vimls.install()
    tsserver.install()
    vsCodeLangServersExtracted.install()
    intelephense.install()
    graphql.install()
    dockerls.install()
end

function config()
    -- @todo check that lspconfig is installed
    vimls.config()
    tsserver.config()
    vsCodeLangServersExtracted.config()
    intelephense.config()
    graphql.config()
    dockerls.config()
end
