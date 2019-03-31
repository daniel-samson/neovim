" Commands
command! IDEversion echom "IDE Version: 0.2.0"
" Plugins
call plug#begin('~/.local/share/nvim/plugged')
"
" Sensible defaults
Plug 'tpope/vim-sensible'

" Toggle Comments
Plug 'tpope/vim-commentary'

" Fix repeat last command
Plug 'tpope/vim-repeat'

" Theming:
Plug 'morhetz/gruvbox'

" Auto saving
Plug '907th/vim-auto-save'

" Auto reloading
Plug 'djoshea/vim-autoread'

" Undo tree navigation
Plug 'sjl/gundo.vim'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" Fast Fuzzy Find
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"
call plug#end()
"
" Theme
if &rtp =~ 'gruvbox'
    colorscheme gruvbox
    set background=dark
    " Fixes
    hi! link phpType GruvboxOrangeBold
    hi! link phpInclude GruvboxOrangeBold
    hi! link phpIdentifier GruvboxPurpleBold
    hi! link phpVarSelector GruvboxPurpleBold
    hi! link phpDocComment GruvboxGreen
    hi! link phpDocTags GruvboxGreenBold
    hi! link phpDocIdentifier GruvboxGreenBold
    hi! link phpDocParam GruvboxGreen
    hi! link phpCommentStar GruvboxGreen
    hi! link phpCommentTitle GruvboxGreen
    hi! link phpFunction GruvboxYellowBold
    hi! link phpMethodsVar GruvboxPurple
    hi! link phpMethod GruvboxYellow
    hi! link phpKeyword GruvboxOrangeBold
    hi! link phpBoolean GruvboxOrangeBold
    hi! link phpNumber GruvboxBlue
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

" Toggle Comment
nmap <A-/>  gcc
vmap <A-/>  gcc
imap <A-/>  <ESC>gcc

" Fast Fuzzy Find
set rtp+=~/.fzf
"" Lines
nmap <A-f> :Lines<cr>
imap <A-f> <ESC>:Lines<cr>
vmap <A-f> <ESC>:Lines<cr>
"" Files
nmap <A-e> :call fzf#run({'sink': 'e', 'options': '-m --preview "bat --color always {}"','down': '90%' })<cr>
imap <A-e> <ESC>:call fzf#run({'sink': 'e', 'options': '-m --preview "bat --color always {}"','down': '90%' })<cr>
vmap <A-e> <ESC>:call fzf#run({'sink': 'e', 'options': '-m --preview "bat --color always {}"','down': '90%' })<cr>
"" Words / tags
nmap <A-F> :Tags<CR>
vmap <A-F> <ESC>:Tags<CR>
imap <A-F> <ESC>:Tags<CR>
"" Git commits
nmap <A-g> :Commits<CR>
vmap <A-g> <ESC>:Commits<CR>
imap <A-g> <ESC>:Commits<CR>
"" Opened files
nmap <A-o> :Buffers<CR>
vmap <A-o> <ESC>:Buffers<CR>
imap <A-o> <ESC>:Buffers<CR>

" Default File Encoding
set encoding=utf-8

" Allow plugin based indentation
filetype plugin indent on

" Set soft limit
set textwidth=80
set colorcolumn=+1

" Indentation and soft limit
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType js setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2 textwidth=120
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

" Auto reload
:autocmd FileChangedShell * :e!

" Undo tree navigation
nmap <A-u> :GundoToggle<cr>

" MakeInstall
map <A-m> :!ctags -R .<cr>

" Move line up
imap <C-A-k> <Esc>ddkkpi

" Move line down
imap <C-A-j> <Esc>ddpi

" Create new line
nmap <Enter> i<Enter>

" Delete current line
nmap <BS> i<BS>

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

" Jump to normal mode
inoremap <A-n> <Esc><Esc><Esc>
vnoremap <A-n> <Esc><Esc><Esc>

" Project Browsing
nnoremap <A-P> :e .<cr>
inoremap <A-P> <Esc>:e .<cr>
vnoremap <A-P> <Esc>:e .<cr>

" Project Browsing (Folder of current file)
nnoremap <A-p> :Explore!<cr>
inoremap <A-p> <Esc>:Explore!<cr>
vnoremap <A-p> <Esc>:Explore!<cr>


" Remap indentation to Tab
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" Start terminal
" split term://bash
vnoremap <A-t> <esc>:belowright split term://bash <cr>
nnoremap <A-t> :belowright split term://bash <cr>
autocmd TermOpen * setlocal scrollback=100000

" Duplicate Line
inoremap <A-d> <Esc>yypi
nnoremap <A-d> <Esc>yyp

" Comment in/out
imap <A-c> <Esc>gcci
nmap <A-c> <Esc>gcc<Esc>
vmap <A-c> gcc<Esc>



