-- aliases
local opt  = vim.opt     -- global
local g  = vim.g     -- global for let options
local wo = vim.wo    -- window local
local bo = vim.bo    -- buffer local
local fn = vim.fn    -- access vim functions
local cmd = vim.cmd  -- vim commands

-- Package Manager (paq)
-- Install on Unix:
-- git clone --depth=5 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
-- 
-- Install on Windows:
-- git clone https://github.com/savq/paq-nvim.git "$env:LOCALAPPDATA\nvim-data\site\pack\paqs\start\paq-nvim"
--
require "paq" {
--
"savq/paq-nvim";                  -- Let Paq manage itself
-- Code of completion
{ "neoclide/coc.nvim", branch = "release" };

-- Powerfull character pair tool
"windwp/nvim-autopairs";
-- Surround
"tpope/vim-surround";
-- Repeat `.` command support
"tpope/vim-repeat";
-- Easy comment out code `gcc`
"tpope/vim-commentary";
-- Auto Save
"pocco85/auto-save.nvim";
-- Auto reload
"djoshea/vim-autoread";
-- Fuzzy Find
"junegunn/fzf";
"junegunn/fzf.vim";
-- Format Support
"mhartington/formatter.nvim";
-- Linter Support
"mfussenegger/nvim-lint";
-- Status line
"ojroques/nvim-hardline";
}

--[
-- Custom Commands
-- ]
-- Reload config (with out restarting nvim)
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {nargs = 0}) 

--[
-- Editor
--]
vim.cmd [[set mouse=a]]
-- use the systems clipboard as the default clipboard
vim.cmd [[ set clipboard+=unnamedplus ]]
vim.api.nvim_set_option('encoding', 'utf-8')
vim.wo.number = true
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_create_autocmd(
    { "FileType" },
    { 
	    pattern = { 
		    "*.json",
		    "*.js",
		    "*.jsx",
		    "*.ts",
		    "*.tsx",
		    "*.html",
		    "*.css",
		    "*.scss" 
	    },
	    command = "setlocal expandtab shiftwidth=6 softtabstop=2"
    }
)
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_set_option('softtabstop', 4)

-- Code of Completion
-- auto-install extensions
vim.g.coc_global_extensions = {
"coc-css",
"coc-eslint",
-- "coc-graphql",
"coc-html",
"coc-json",
"coc-prettier",
-- "coc-rust-analyzer",
"coc-sh",
"coc-tsserver",
"coc-xml",
"coc-yaml",
}

vim.cmd [[
command! -nargs=0 Format :call CocActionAsync('format')
]]

vim.api.nvim_set_keymap('n', 'gtd', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gti', '<Plug>(coc-implementation)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gtt', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gtr', '<Plug>(coc-references)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(coc-codeaction)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-rename)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '=', ":Format<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '=', "<Plug>(coc-format-selected", { noremap = true, silent = true })

-- Tab Completion
-- use <tab> for trigger completion and navigate to the next complete item
vim.cmd [[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
]]

-- use <CR> to select the first or currently selected
vim.cmd([[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]])

vim.cmd [[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
]]

vim.cmd [[
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
]]
-- Status Line
require('hardline').setup {}

-- [[
-- Modern Text Editor Features
--]]
-- Selection
vim.api.nvim_set_keymap('n', '<S-Up>', '<S-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', '<S-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Left>', '<C-v>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Right>', '<C-v>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Up>', '<ESC><S-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Down>', '<ESC><S-v>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Left>', '<ESC><C-v>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Right>', '<ESC><C-v>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Left>', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Right>', 'l', { noremap = true, silent = true })
-- Select All
vim.api.nvim_set_keymap('n', 'gA', 'ggVG', { noremap = true, silent = true })
-- Deselect All
vim.api.nvim_set_keymap('n', '\\\\', '<ESC>:noh<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '\\\\', '<ESC>:noh<cr>', { noremap = true, silent = true })
-- Indentation
vim.api.nvim_set_keymap('n', '<TAB>', '>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<TAB>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-TAB>', '<gv', { noremap = true, silent = true })
-- Duplicate Line
vim.api.nvim_set_keymap('n', 'gd', 'Yp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gd', '<Esc>Yp', { noremap = true, silent = true })
-- Move Line
vim.api.nvim_set_keymap('n', 'gk', 'ddkkp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gj', 'ddp', { noremap = true, silent = true })
-- Create New Line when press return
vim.api.nvim_set_keymap('n', '<Enter>', 'i<Enter>', { noremap = true, silent = true })
-- Delete character from normal mode
vim.api.nvim_set_keymap('n', '<BS>', 'i<BS>', { noremap = true, silent = true })
-- Fuzzy Find
-- Command bar
vim.api.nvim_set_keymap('n', 'gP', ':Command<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gP', ':Command<cr>', { noremap = true, silent = true })
-- File bar
vim.api.nvim_set_keymap('n', 'gp', ':Files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gp', ':Files<cr>', { noremap = true, silent = true })
-- Open Explorer
vim.api.nvim_set_keymap('n', 'go', ':Explore<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'go', ':Explore<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gO', ':Explore .<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gO', ':Explore .<cr>', { noremap = true, silent = true })
-- Open Project File search
vim.api.nvim_set_keymap('n', 'gf', ':BLines<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gf', ':BLines<cr>', { noremap = true, silent = true })
-- Open Current File search
vim.api.nvim_set_keymap('n', 'gF', ':Rg<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gF', ':Rg<cr>', { noremap = true, silent = true })
-- List Opened Files (buffers in vim speak)
vim.api.nvim_set_keymap('n', 'gl', ':Buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gl', ':Buffers<cr>', { noremap = true, silent = true })

-- Load user customisations
require('init-user')

