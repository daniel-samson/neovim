function neovim_install_plug_manager {
h=$HOME;
run_command "curl -fLo $h/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
}
