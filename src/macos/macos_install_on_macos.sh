function install_on_macos() {
    macos_install_xcode;
    macos_install_homebrew;
    macos_install_ripgrep;
    macos_install_bat;
    macos_install_neovim;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    macos_install_rust_env;
    macos_install_nodejs_env;   
}
