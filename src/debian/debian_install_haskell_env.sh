function debian_install_haskell_env {
read -p "Would you like to install the haskell environment (y/n)?" choice
case "$choice" in
  y|Y )
    run_command "curl -sS https://get.haskellstack.org/ -o install_haskell.sh";
    run_command "chmod a+x install_haskell.sh";
    run_command "./install_haskell.sh -f";
    ;;
  n|N )
    echo "OK, moving on.";
    ;;
  * )
      debian_install_haskell_env;
      ;;
esac;
}
