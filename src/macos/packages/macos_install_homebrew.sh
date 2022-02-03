function macos_install_homebrew() {
    if command -v brew;
    then
        echo "homebrew is installed";
    else
        run_command "curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh";
    fi;
}
