function debian_install_nodejs_env {
read -p "Would you like to install the nodejs/typescript environment (y/n)?" choice
case "$choice" in
  y|Y )
        run_command "curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh";
        run_command "chmod a+x nodesource_setup.sh";
        run_command_as_root "./nodesource_setup.sh";
        run_command_as_root "npm install -g typescript";
        run_command_as_root "apt-get install -y build-essential";
      ;;
  n|N )
      echo "OK, moving on."
      ;;
  * )
      debian_install_nodejs_env
      ;;
esac;

}
