":Commands
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

" Configure vim per project
Plug 'daniel-samson/dirvimrc'
" Database Client
Plug 'tpope/vim-dadbod'
"
Plug 'blueshirts/darcula'
" rest client
Plug 'diepm/vim-rest-console'
"
call plug#end()
"
" Theme
" if &rtp =~ 'gruvbox'
"     colorscheme gruvbox
"     set background=dark 
" endif
colorscheme darcula

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
" set number

" Use System Clipboard as the default register
if has('clipboard')
    set clipboard^=unnamedplus
endif

" Set path to recusively search all directories for :find
set path^=**

" Displays all files when we press tab
set wildmenu

"" File Editing
""
" Toggle Comment
nmap <A-/>  gcc
vmap <A-/>  gcc
imap <A-/>  <ESC>gcc
" Duplicate Line
vnoremap <A-d> Yp
inoremap <A-d> <Esc>yypi
nnoremap <A-d> <Esc>yyp
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
""
" Remap indentation to Tab
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" Emulate Shift Selection
nnoremap <S-Up> <S-v>k
inoremap <S-Up> <S-v>k
vnoremap <S-Up> k
nnoremap <S-Down> <S-v>j
inoremap <S-Down> <S-v>j
vnoremap <S-Down> j
nnoremap <S-Left> <C-v>h
inoremap <S-Left> <C-v>h
vnoremap <S-Left> h
nnoremap <C-S-Left> <C-v>b
inoremap <C-S-Left> <C-v>b
vnoremap <C-S-Left> b
nnoremap <S-Right> <C-v>l
inoremap <S-Right> <C-v>l
vnoremap <S-Right> l
nnoremap <C-S-Right> <C-v>e
inoremap <C-S-Right> <C-v>e
vnoremap <C-S-Right> e

""
" Fast Fuzzy Find
set rtp+=~/.fzf

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, fzf#vim#with_preview('right:60%'))
  " \   'echo '.shellescape(<q-args>), 1, fzf#vim#with_preview('right:60%'))
  " \   'rgtags '.shellescape(<q-args>), 1, fzf#vim#with_preview('right:60%'))
"" Lines
nmap <A-f> :Lines<cr>
imap <A-f> <ESC>:Lines<cr>
vmap <A-f> <ESC>:Lines<cr>
"" Files
nmap <A-e> :call fzf#run({'sink': 'e', 'options': '-m --preview "bat --color always {}"','down': '90%' })<cr>
imap <A-e> <ESC>:call fzf#run({'sink': 'e', 'options': '-m --preview "bat --color always {}"','down': '90%' })<cr>
vmap <A-e> <ESC>:call fzf#run({'sink': 'e', 'options': '-m --preview "bat --color always {}"','down': '90%' })<cr>
"" Words / tags
nmap <A-F> :Rg<CR>
vmap <A-F> <ESC>:Rg<CR>
imap <A-F> <ESC>:Rg<CR>
"" Git commits
nmap <A-g> :Commits<CR>
vmap <A-g> <ESC>:Commits<CR>
imap <A-g> <ESC>:Commits<CR>
"" Opened files
nmap <A-o> :Buffers<CR>
vmap <A-o> <ESC>:Buffers<CR>
imap <A-o> <ESC>:Buffers<CR>

""
""
" Default File Encoding
set encoding=utf-8

" Allow plugin based indentation
filetype plugin indent on

" Set soft limit
set textwidth=79
set colorcolumn=+1

""File types
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4 textwidth=119 number
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2 number
autocmd FileType js setlocal expandtab shiftwidth=2 softtabstop=2 number
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2 textwidth=119 number
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2 number
autocmd FileType sass setlocal expandtab shiftwidth=2 softtabstop=2 number
autocmd FileType scss setlocal expandtab shiftwidth=2 softtabstop=2 number
autocmd FileType csv setlocal number
autocmd FileType sql setlocal number
autocmd FileType py setlocal number
autocmd FileType rb setlocal number
autocmd FileType xml setlocal number
autocmd FileType vim setlocal number
autocmd FileType sh setlocal number

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

let vim_dir = getcwd()
let &runtimepath.=','. vim_dir

" Project File
let my_project_dir = expand(vim_dir . '/.vim')
call system('mkdir ' . my_project_dir)
let g:fzf_tags_command = 'ctags -R .'
call system('mkdir '. my_project_dir . '/fzf-history')
let g:fzf_history_dir = my_project_dir.'/fzf-history'

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    " Create dirs
    call system('mkdir ' . my_project_dir)
    let undo_dir = expand(my_project_dir . '/undodir')
    call system('mkdir ' . undo_dir)
    let &undodir = undo_dir
    set undofile
endif




" Auto saving
let g:auto_save = 1
let g:auto_save_silent = 1

" Auto reload
:autocmd FileChangedShell * :e!

" Undo tree navigation
nmap <A-u> :GundoToggle<cr>


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
vnoremap <A-n> <Esc><Esc><Esc>

" Project Browsing
nnoremap <A-P> :e .<cr>
inoremap <A-P> <Esc>:e .<cr>
vnoremap <A-P> <Esc>:e .<cr>

" Project Browsing (Folder of current file)
nnoremap <A-p> :Explore!<cr>
inoremap <A-p> <Esc>:Explore!<cr>
vnoremap <A-p> <Esc>:Explore!<cr>

" Start terminal
inoremap <A-t> <esc>:belowright split term://bash <cr>
vnoremap <A-t> <esc>:belowright split term://bash <cr>
nnoremap <A-t> :belowright split term://bash <cr>
let g:terminal_scrollback_buffer_size = 100000


" Terminal Emulator Settings
autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <Esc> <C-\><C-n>:q<cr>

