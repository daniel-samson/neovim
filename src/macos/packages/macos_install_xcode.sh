function macos_install_xcode() {
    if command -v brew;
    then
        echo "Assuming xcode is installed";
    else
        run_command "xcode-select --install";
    fi;
}
