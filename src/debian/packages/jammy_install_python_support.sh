function focal_install_python_support {
run_command_as_root "apt install -y python3-pip";
run_command_as_root "apt install -y build-essential libssl-dev libffi-dev";
run_command_as_root "apt install -y python3-dev python3-venv";
run_command_as_root "pip3 install neovim";
PYENV="$HOME/.python_env";
run_command "mkdir -p $PYENV";
run_command "cd $PYENV";
run_command "python3 -m venv test_env";
if grep -q "source $PYENV/test_env" ~/.bash_aliases;
then
    echo "Python connfigured";
else
    echo "source $PYENV/test_env" >> ~/.bash_aliases;
fi
}
