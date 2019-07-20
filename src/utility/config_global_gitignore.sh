function config_global_gitignore {
    h=$HOME
    run_command "touch $h/.gitignore_global";
    run_command "git config --global core.excludesfile $h/.gitignore_global";
    run_command "printf \".vim/\ntags\n*.vimrc\" >> $h/.gitignore_global";
}
