function debian_install_clipboard {
    run_command_as_root "apt-get install xsel";
}
