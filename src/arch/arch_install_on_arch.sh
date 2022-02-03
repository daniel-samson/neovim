function arch_install_on_arch() {
    run_command_as_root "pacman -Sy";
    arch_install_ripgrep;
    arch_install_bat;
    arch_install_neovim;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    arch_install_rust_env;
    arch_install_nodejs_env; 
}
