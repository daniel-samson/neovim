function arch_install_ripgrep() {
    run_command_as_root "pacman -S --noconfirm ripgrep"
}
