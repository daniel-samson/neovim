function debian_install_neovim_xenial {
run_command_as_root "add-apt-repository -y ppa:neovim-ppa/stable";
run_command_as_root "apt-get update";
run_command_as_root "apt-get install -y neovim";
}
