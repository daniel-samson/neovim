function throw_unsupported_os() {
    echo "Unsupported distribution version/codename";
    echo $1;
    exit 1;
}

function detect_os {
    echo "
    Detecting OS
    ";

    OS=$( uname -s);
    case $OS in 
        Darwin) echo "Found MacOS"; OS="MacOs";;
        Linux) echo "Found Linux"; OS="Linux";;
        GNU/Linux) echo "GNU/Linux"; OS="Linux";;
        *) throw_unsupported_os $OS;;
    esac
}
