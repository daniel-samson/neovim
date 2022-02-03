function arch_install_bat() {
    run_command_as_root "pacman -S --noconfirm bat"
}
