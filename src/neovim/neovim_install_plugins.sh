function neovim_install_plugins {
run_command "nvim +PlugInstall +UpdateRemotePlugins +qa";
}
