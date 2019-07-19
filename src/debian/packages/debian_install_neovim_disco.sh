function debian_install_neovim_disco {
run_command_as_root "apt-get update";
run_command_as_root "apt-get install -y neovim";
}
