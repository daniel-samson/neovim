function debian_install_python_support {
run_command_as_root "apt-get install -y python-pip python3-pip";
run_command_as_root "pip install neovim";
run_command_as_root "pip3 install neovim";
}
