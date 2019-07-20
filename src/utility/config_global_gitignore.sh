function config_global_gitignore {
    h=$HOME
    gifile=".gitignore_global"
    run_command "touch $h/$gifile";
    run_command "git config --global core.excludesfile $h/$gifile";
    echo .vim/ >> $h/$gifile
    echo .vimrc >> $h/$gifile
    echo .vimrc/ >> $h/$gifile
    echo tags >> $h/$gifile
}
