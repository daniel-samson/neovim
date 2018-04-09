#!/bin/bash
set -e


function build_config {
    mkdir -p ~/.config/nvim/;
    echo "
call plug#begin('~/.local/share/nvim/plugged')
\" Sensible defaults
Plug 'tpope/vim-sensible'

\" Editing Files:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

\" Airline bar:
Plug 'bling/vim-airline'

\" Display git branch in airline bar
Plug 'renyard/vim-git-flow-format'
Plug 'tpope/vim-fugitive'

\" Theming:
Plug 'morhetz/gruvbox'

\" Fast Searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

\" Programming Language support
Plug 'sheerun/vim-polyglot'

\" Syntax
Plug 'scrooloose/syntastic'

\" Auto saving
Plug '907th/vim-auto-save'

\" Auto reloading
Plug 'djoshea/vim-autoread'

\" Undo tree navigation
Plug 'sjl/gundo.vim'

\" Show changes in gutter
Plug 'airblade/vim-gitgutter'

\" Debugger support
Plug 'joonty/vdebug'

\" List tags in a file
Plug 'vim-scripts/taglist.vim'

\" Project Tree
Plug 'daniel-samson/project-tree.vim'

\" Auto close characters
Plug 'townk/vim-autoclose'
\" Sensible defaults
Plug 'tpope/vim-sensible'

\" Editing Files:
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

\" Airline bar:
Plug 'bling/vim-airline'

\" Display git branch in airline bar
Plug 'renyard/vim-git-flow-format'
Plug 'tpope/vim-fugitive'

\" Theming:
Plug 'morhetz/gruvbox'

\" Fast Searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

\" Programming Language support
Plug 'sheerun/vim-polyglot'

\" Syntax
Plug 'scrooloose/syntastic'

\" Auto saving
Plug '907th/vim-auto-save'

\" Auto reloading
Plug 'djoshea/vim-autoread'

\" Undo tree navigation
Plug 'sjl/gundo.vim'

\" Show changes in gutter
Plug 'airblade/vim-gitgutter'

\" Debugger support
Plug 'joonty/vdebug'

\" List tags in a file
Plug 'vim-scripts/taglist.vim'

\" Project Tree
Plug 'daniel-samson/project-tree.vim'

\" Auto close characters
Plug 'townk/vim-autoclose'

\" Auto completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

if executable('npm')
    Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
    Plug 'mhartington/nvim-typescript'
endif

if executable('php')
Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
Plug 'roxma/ncm-phpactor'
Plug 'alvan/vim-php-manual'
endif

Plug 'othree/csscomplete.vim'
Plug 'calebeby/ncm-css'

if executable('racer')
\" rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'
endif

Plug 'roxma/nvim-completion-manager'
call plug#end()

\" Theme
\" {rtp}/autoload/has.vim
function! HasPlugin(name)
    let pat = '/'.a:name
    return !empty(globpath(&rtp, pat))
endfunction

if HasPlugin('gruvbox')
    colorscheme gruvbox
    set background=dark
endif

\" Turn off swap files
set noswapfile

\" Mouse Support
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

\" <Leader> key
let mapleader='\'

\" Show Line Numbers
set number

\" Use System Clipboard as the default register
if has('clipboard')
    set clipboard^=unnamedplus
endif
\" Set path to recusively search all directories for :find
set path^=**

\" Displays all files when we press tab
set wildmenu

\"Set gutter
set foldcolumn=1

\" Fast Fuzzy Find
set rtp+=~/.fzf
nmap <leader>ff :Files<CR>
nmap <leader>fw :Tags<CR>
nmap <leader>fg :Commits<CR>
nmap <leader>fb :Buffers<CR>

\" Default File Encoding
set encoding=utf-8

\" Allow plugin based indentation
filetype plugin indent on

\" Indentation
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType js setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType sass setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal expandtab shiftwidth=2 softtabstop=2

\" Default Indentation
set expandtab
set shiftwidth=4
set softtabstop=4

\" Highlight tabs and trailing spaces
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set list
highlight SpecialKey term=standout ctermbg=DarkRed guibg=#aaddcc
highlight RedundantSpaces term=standout ctermbg=DarkRed guibg=#aaddcc    
call matchadd('RedundantSpaces', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')

\" Keep undo history across sessions by storing it in a file
let vimHistoryDir = '~/.vimhistory'
let &runtimepath.=','.vimHistoryDir
if has('persistent_undo')
    let myUndoDir = expand(vimHistoryDir . '/undodir')
    \" Create dirs
    call system('mkdir ' . vimHistoryDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

\" Auto saving
let g:auto_save = 1
let g:auto_save_silent = 1

\" Syntax checking
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']

\" Auto reload
:autocmd FileChangedShell * :e!

\" Undo tree navigation
nmap <leader>u :GundoToggle<cr>

\" Tree structure
map <leader>p :ToggleProjectTree<cr>

\" MakeInstall
map <leader>m :!ctags -R .<cr>

nmap <leader>l :TlistToggle<CR>

\" Move line up
imap <C-k> <Esc>ddkkpi

\" Move line down
imap <C-j> <Esc>ddpi

\" Create new line
nmap <Enter> i<Enter>

\" Delete current line
nmap <BS> i<BS>

set textwidth=80
set colorcolumn=+1

\" Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

\" Terminal Emulator Settings
autocmd BufWinEnter,WinEnter term://* startinsert

tnoremap <Esc> <C-\><C-n>

\" Window Navigation
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

\" Start terminal
\"split term://bash
inoremap <leader>t :split term://bash <cr>
noremap <leader>t :split term://bash <cr>

\" Debugging
let g:vdebug_keymap = {
    \    \"run\" : \"<F5>\",
    \    \"run_to_cursor\" : \"<F9>\",
    \    \"step_over\" : \"<F8>\",
    \    \"step_into\" : \"<F7>\",
    \    \"step_out\" : \"<S-F8>\",
    \    \"close\" : \"<F6>\",
    \    \"detach\" : \"<F4>\",
    \    \"set_breakpoint\" : \"<F10>\",
    \    \"get_context\" : \"<F11>\",
    \    \"eval_under_cursor\" : \"<F12>\",
    \    \"eval_visual\" : \"<Leader>e\",
    \}
" >> ~/.config/nvim/init.vim;
}
function finish_install {
echo "nvim is configured and installed";
}
#!/bin/bash
function run_command_as_root(){
COMMAND=$1;
if [[ $(id -u) -eq 0 ]];
then
    echo $COMMAND;
    $COMMAND
elif command -v sudo;
then
    echo "sudo $COMMAND";
    sudo $COMMAND;
elif command -v su;
then
    echo "su -c \"$COMMAND\"";
    su -c "$COMMAND";
else
    print "Error: unable to run command $COMMAND as root";
    exit 1;
fi
}
#!/bin/bash
function run_command(){
COMMAND=$1;
echo $COMMAND;
$COMMAND
}
function neovim_install_plugins {
nvim +PlugInstall +qa
}
function neovim_install_plug_manager {
run_command "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
}
function debian_apt_update {
run_command_as_root "apt update";
}
function debian_install_clipboard {
    run_command_as_root "apt-get install xsel";
}
function debian_install_curl {
run_command_as_root "apt-get install -y curl";
}
function debian_install_neovim {
run_command_as_root "apt-get install -y neovim";
}
function debian_install_nodejs_env {
read -p "Would you like to install the nodejs/typescript environment (y/n)?" choice
case "$choice" in
  y|Y )
        run_command "curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh";
        run_command "chmod a+x nodesource_setup.sh";
        run_command_as_root "./nodesource_setup.sh";
        run_command_as_root "npm install -g typescript";
      ;;
  n|N )
      echo "OK, moving on."
      ;;
  * )
      debian_install_nodejs_env
      ;;
esac;

}
function debian_install_on_jessie {
    echo "Preparing to install on Debian Jessie";
    debian_apt_update;
    debian_install_python_support;
    debian_install_neovim;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
function debian_install_on_stretch {
    echo "Preparing to install on Debian Stretch";
    debian_apt_update;
    debian_install_python_support;
    debian_install_neovim;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
function debian_install_on_xenial {
    echo "Preparing to install on Ubuntu Xenial";
    debian_apt_update;
    debian_install_python_support;
    debian_install_neovim;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
function debian_install_php_env {
read -p "Would you like to install the php environment (y/n)?" choice
case "$choice" in
  y|Y )
       run_command_as_root "apt install php-cli";
        run_command "curl -sS https://getcomposer.org/installer > install_composer.sh";
        run_command_as_root "php install_composer.sh --install-dir=/usr/local/bin --filename=composer";
        run_command "composer global require friendsofphp/php-cs-fixer";
        run_command "composer global require phpmd/phpmd";
        run_command "composer global require leafo/scssphp";
        run_command "composer global require codeception/codeception";
        run_command "composer global require sebastian/phpcpd";
        # Install Composer Path
        COMPOSER=$(composer global config bin-dir --absolute);
        if grep -q "export PATH=\$PATH:$COMPOSER" ~/.bash_aliases;
        then 
            echo "Composer bin already configured";
        else 
            echo "export PATH=\$PATH:$COMPOSER" >> ~/.bash_aliases;
    fi
      ;;
  n|N ) echo "OK, moving on.";;
  * ) debian_install_php_env;;
esac;
}

function debian_install_python_support {
run_command_as_root "apt-get install -y python-pip python3-pip";
run_command_as_root "pip install neovim";
run_command_as_root "pip3 install neovim";
}
function debian_install_rust_env {
read -p "Would you like to install the rust environment (y/n)?" choice
case "$choice" in
  y|Y )
    run_command "curl -sS https://sh.rustup.rs -o install_rust.sh";
    run_command "chmod a+x install_rust.sh";
    run_command "./install_rust.sh";
    if grep -q "source $HOME/.cargo/env" ~/.bash_aliases;
        then
            echo "Cargo configured";
        else
            echo "source $HOME/.cargo/env" >> ~/.bash_aliases;
    fi
    if grep -q "export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src" ~/.bash_aliases;
        then
            echo "RUST_SRC_PATH configured";
        else
            echo "export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src" >> ~/.bash_aliases;
    fi

    run_command "rustup update";
    run_command "export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src";
    run_command "rustup install nightly";
    run_command "rustup component add rls-preview --toolchain nightly";
    run_command "rustup component add rust-analysis --toolchain nightly";
    run_command "rustup component add rust-src --toolchain nightly";
    run_command "cargo install racer --force";
    ;;
  n|N )
    echo "OK, moving on.";
    ;;
  * )
      debian_install_rust_env;
      ;;
esac;
}
function debian_replace_vim {
read -p "Would you like to replace vim with nvim (y/n)?" choice
case "$choice" in
  y|Y )
      run_command_as_root "rm -f /usr/local/bin/vim";
      run_command_as_root "ln -s /usr/bin/nvim /usr/local/bin/vim";
      ;;
  n|N ) echo "OK, You will need to run nvim instead of vim.";;
  * ) debian_replace_vim;;
esac;
}

function detect_os {
echo "
Detecting OS
";

if command -v lsb_release;
then
    echo "Found lsb_release";
else
    echo "lsb_release is not installed";
fi;

case $(lsb_release -cs) in
    stretch) echo "Found Debian Stretch";
        debian_install_on_stretch;
        ;;
    jessie) echo "Found Debian Jessie";
        debian_install_on_jessie;
        ;;
    xenial) echo "Found Xenial (Ubuntu 16.04)";
        debian_install_on_xenial;
        ;;
    *) echo "Unsupported distribution version/codename"; 
        exit;
        ;;
esac

}
detect_os;
finish_install
