#!/bin/bash
set -e


function build_config {
    echo "
call plug#begin('~/.vim/plugged')
call plug#end()
";
}
function debian_install_on_jessie {
    echo "Preparing to install on Debian Jessie";
}
function debian_install_on_stretch {
    echo "Preparing to install on Debian Stretch";
}
function debian_install_on_xenial {
    echo "Preparing to install on Ubuntu Xenial";
}

function detect_os {
echo "
Detecting OS
";

if command -v lsb_release;
then
    echo "Found lsb_release";
else
    echo "lsb_release is not installed";
fi;

case $(lsb_release -cs) in
    stretch) echo "Found Debian Stretch";
        debian_install_on_stretch;
        ;;
    jessie) echo "Found Debian Jessie";
        debian_install_on_jessie;
        ;;
    xenial) echo "Found Xenial (Ubuntu 16.04)";
        debian_install_on_xenial;
        ;;
    *) echo "Unsupported distribution version/codename"; 
        exit;
        ;;
esac

}
detect_os;
