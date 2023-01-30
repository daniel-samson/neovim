function neovim_install_plugins {
run_command "nvim +PaqClean +qa";
run_command "nvim +PaqInstall +qa";
}
