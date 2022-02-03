function arch_install_curl() {
    run_command_as_root "pacman -S --noconfirm curl"
}
