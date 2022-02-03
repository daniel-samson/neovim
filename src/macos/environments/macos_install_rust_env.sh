function macos_install_rust_env() {
      read -p "Would you like to install the rust environment (y/n)?" choice
    case "$choice" in
    y|Y)
        run_command "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh";
        ;;
    n|N)
        echo "OK, moving on.";
        ;;
    *)
        macos_install_nodejs_env;
        ;;
    esac;   
}
