function deepin_replace_vim {
read -p "Would you like to replace vim with nvim (y/n)?" choice
case "$choice" in
  y|Y )
      run_command_as_root "rm -f /usr/bin/vim";
      run_command_as_root "ln -s /usr/bin/nvim /usr/bin/vim";
      ;;
  n|N ) echo "OK, You will need to run nvim instead of vim.";;
  * ) deepin_replace_vim;;
esac;
}
