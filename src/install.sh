detect_os;

case $OS in 
    Linux) detect_linux_distribution ;;
    MacOs) install_on_macos ;;
esac

finish_install
