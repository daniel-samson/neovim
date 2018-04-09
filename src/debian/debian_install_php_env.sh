function debian_install_php_env {
read -p "Would you like to install the php environment (y/n)?" choice
case "$choice" in
  y|Y )
       run_command_as_root "apt install php-cli";
        run_command "curl -sS https://getcomposer.org/installer > install_composer.sh";
        run_command_as_root "php install_composer.sh --install-dir=/usr/local/bin --filename=composer";
        run_command "composer global require friendsofphp/php-cs-fixer";
        run_command "composer global require phpmd/phpmd";
        run_command "composer global require leafo/scssphp";
        run_command "composer global require codeception/codeception";
        run_command "composer global require sebastian/phpcpd";
        # Install Composer Path
        COMPOSER=$(composer global config bin-dir --absolute);
        if grep -q "export PATH=\$PATH:$COMPOSER" ~/.bash_aliases;
        then 
            echo "Composer bin already configured";
        else 
            echo "export PATH=\$PATH:$COMPOSER" >> ~/.bash_aliases;
    fi
      ;;
  n|N ) echo "OK, moving on.";;
  * ) debian_install_php_env;;
esac;
}

