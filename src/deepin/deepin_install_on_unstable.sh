function deepin_install_on_unstable {
    echo "Preparing to install on Deepin Unstable";
    debian_apt_update;
    debian_install_exuberant_ctags;
    debian_install_git;
    debian_install_python_support;
    debian_install_neovim;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
