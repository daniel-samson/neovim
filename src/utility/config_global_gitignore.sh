function config_global_gitignore {
    read -p "Would you like to setup global git ignore (y/n)?" choice
    case "$choice" in
    y|Y)
        h=$HOME
        gifile=".gitignore_global"
        run_command "touch $h/$gifile";
        run_command "git config --global core.excludesfile $h/$gifile";
        echo .vim/ >> $h/$gifile
        echo .vimrc >> $h/$gifile
        echo .vimrc/ >> $h/$gifile
        echo tags >> $h/$gifile
        ;;
    n|N )
        echo "OK, moving on.";
        ;;
    *)
        macos_install_nodejs_env;
        ;;
    esac;
}
