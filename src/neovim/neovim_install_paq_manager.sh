function neovim_install_paq_manager {
h=$HOME;
run_command "git clone --depth=1 https://github.com/savq/paq-nvim.git $h/.local/share/nvim/site/pack/paqs/start/paq-nvim";
}
