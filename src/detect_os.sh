function throw_unsupported_os() {
    echo "Unsupported distribution version/codename";
    echo $1;
    exit 1;
}

function throw_unsupported_distrobution() {
    echo "Unsupported distribution version/codename";
    echo $(lsb_release -a);
    exit 1;
}

function detect_os {
    echo "
    Detecting OS
    ";

    OS=$( uname -s);
    case $OS in 
        Darwin) echo "Found MacOS";;
        Linux) echo "Found Linux";;
        GNU/Linux) echo "GNU/Linux";;
        *) throw_unsupported_os $OS;;
    esac

    return $OS
}

detect_os;
