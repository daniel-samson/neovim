function arch_install_neovim() {
    run_command_as_root "pacman -S --noconfirm neovim"
}
