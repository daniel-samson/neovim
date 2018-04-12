call plug#begin('~/.local/share/nvim/plugged')
" Sensible defaults
Plug 'tpope/vim-sensible'

" Editing Files:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Airline bar:
Plug 'bling/vim-airline'

" Display git branch in airline bar
Plug 'renyard/vim-git-flow-format'
Plug 'tpope/vim-fugitive'

" Theming:
Plug 'morhetz/gruvbox'

" Fast Searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Programming Language support
Plug 'sheerun/vim-polyglot'

" Syntax
Plug 'scrooloose/syntastic'

" Auto saving
Plug '907th/vim-auto-save'

" Auto reloading
Plug 'djoshea/vim-autoread'

" Undo tree navigation
Plug 'sjl/gundo.vim'

" Show changes in gutter
Plug 'airblade/vim-gitgutter'

" Debugger support
Plug 'joonty/vdebug'

" List tags in a file
Plug 'vim-scripts/taglist.vim'

" Project Tree
Plug 'daniel-samson/project-tree.vim'

" Auto close characters
Plug 'townk/vim-autoclose'
" Sensible defaults
Plug 'tpope/vim-sensible'

" Editing Files:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Airline bar:
Plug 'bling/vim-airline'

" Display git branch in airline bar
Plug 'renyard/vim-git-flow-format'
Plug 'tpope/vim-fugitive'

" Theming:
Plug 'morhetz/gruvbox'

" Fast Searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Programming Language support
Plug 'sheerun/vim-polyglot'

" Syntax
Plug 'scrooloose/syntastic'

" Auto saving
Plug '907th/vim-auto-save'

" Auto reloading
Plug 'djoshea/vim-autoread'

" Undo tree navigation
Plug 'sjl/gundo.vim'

" Show changes in gutter
Plug 'airblade/vim-gitgutter'

" Debugger support
Plug 'joonty/vdebug'

" List tags in a file
Plug 'vim-scripts/taglist.vim'

" Project Tree
Plug 'daniel-samson/project-tree.vim'

" Auto close characters
Plug 'townk/vim-autoclose'

" Auto completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

if executable('npm')
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
endif
if executable('tsc')
    Plug 'mhartington/nvim-typescript', {'do': 'nvim +UpdateRemotePlugins'}
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'Quramy/tsuquyomi/' 
endif
if executable('php')
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
Plug 'roxma/ncm-phpactor'
Plug 'alvan/vim-php-manual'
endif

Plug 'othree/csscomplete.vim'
Plug 'calebeby/ncm-css'

if executable('racer')
" rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'
endif

Plug 'roxma/nvim-completion-manager'
call plug#end()

"Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Theme
if &rtp =~ 'gruvbox'
    colorscheme gruvbox
    set background=dark
endif

" Turn off swap files
set noswapfile

" Mouse Support
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

" <Leader> key
let mapleader='\'

" Show Line Numbers
set number

" Use System Clipboard as the default register
if has('clipboard')
    set clipboard^=unnamedplus
endif
" Set path to recusively search all directories for :find
set path^=**

" Displays all files when we press tab
set wildmenu

"Set gutter
set foldcolumn=1

" Fast Fuzzy Find
set rtp+=~/.fzf
nmap <leader>ff :Files<CR>
nmap <leader>fw :Tags<CR>
nmap <leader>fg :Commits<CR>
nmap <leader>fb :Buffers<CR>

" Default File Encoding
set encoding=utf-8

" Allow plugin based indentation
filetype plugin indent on

" Indentation
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType js setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 softtabstop=2

" Default Indentation
set expandtab
set shiftwidth=4
set softtabstop=4

" Highlight tabs and trailing spaces
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set list
highlight SpecialKey term=standout ctermbg=DarkRed guibg=#aaddcc
highlight RedundantSpaces term=standout ctermbg=DarkRed guibg=#aaddcc    
call matchadd('RedundantSpaces', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')

" Keep undo history across sessions by storing it in a file
let vimHistoryDir = '~/.vimhistory'
let &runtimepath.=','.vimHistoryDir
if has('persistent_undo')
    let myUndoDir = expand(vimHistoryDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimHistoryDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Auto saving
let g:auto_save = 1
let g:auto_save_silent = 1

" Syntax checking
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
" Auto reload
:autocmd FileChangedShell * :e!

" Undo tree navigation
nmap <leader>u :GundoToggle<cr>

" Tree structure
map <leader>p :ToggleProjectTree<cr>

" MakeInstall
map <leader>m :!ctags -R .<cr>

nmap <leader>l :TlistToggle<CR>

" Move line up
imap <C-k> <Esc>ddkkpi

" Move line down
imap <C-j> <Esc>ddpi

" Create new line
nmap <Enter> i<Enter>

" Delete current line
nmap <BS> i<BS>

set textwidth=80
set colorcolumn=+1

" Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

" Terminal Emulator Settings
autocmd BufWinEnter,WinEnter term://* startinsert

tnoremap <Esc> <C-\><C-n>

" Window Navigation
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Start terminal
"split term://bash
inoremap <leader>t :split term://bash <cr>
noremap <leader>t :split term://bash <cr>

" Debugging
let g:vdebug_keymap = {
    \    "run" : "<F5>",
    \    "run_to_cursor" : "<F9>",
    \    "step_over" : "<F8>",
    \    "step_into" : "<F7>",
    \    "step_out" : "<S-F8>",
    \    "close" : "<F6>",
    \    "detach" : "<F4>",
    \    "set_breakpoint" : "<F10>",
    \    "get_context" : "<F11>",
    \    "eval_under_cursor" : "<F12>",
    \    "eval_visual" : "<Leader>e",
    \}

if &rtp =~ 'phpactor'
    nmap <Leader>] :call phpactor#GotoDefinition()<CR>
    nmap <Leader>fr :call phpactor#FindReferences()<CR><CR>
    vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
    autocmd FileType php setlocal omnifunc=phpactor#Complete
endif
