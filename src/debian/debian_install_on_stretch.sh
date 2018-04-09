function debian_install_on_stretch {
    echo "Preparing to install on Debian Stretch";
    debian_apt_update;
    debian_install_python_support;
    debian_install_neovim;
    debian_install_curl;
    debian_install_php_env;
    debian_install_rust_env;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
