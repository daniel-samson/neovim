function macos_install_python3() {
    if command -v python3;
    then
        echo "Found python3 is installed";
    else
        run_command "brew install python3";
        run_command "python3 -m pip install setuptools";
        run_command "python3 -m pip install upgrade pynvim";
    fi;
}
