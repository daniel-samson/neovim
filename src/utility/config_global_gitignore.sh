function config_global_gitignore {
    run_command "touch ~/.gitignore_global";
    run_command "git config --global core.excludesfile ~/.gitignore_global";
    run_command 'echo ".vim_project" >> ~/.gitignore_global';
}
