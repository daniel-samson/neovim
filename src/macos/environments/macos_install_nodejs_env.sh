function macos_install_nodejs_env () {
    read -p "Would you like to install the nodejs environment (y/n)?" choice
    case "$choice" in
    y|Y)
        run_command "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"
        run_command "nvm install node"
        run_command "nvm use node"
        run_command "nvm alias default node"
        ;;
    n|N )
        echo "OK, moving on.";
        ;;
    *)
        macos_install_nodejs_env;
        ;;
    esac;
}
