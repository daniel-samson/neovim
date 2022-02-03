function throw_unsupported_distribution() {
echo "Unsupported distribution version/codename";
echo $(lsb_release -a);
exit 1;
}


function detect_ubuntu_release() {
case $(lsb_release -cs) in
    focal) echo "Found Disco (Ubuntu 20.04)"; debian_install_on_focal;;
    disco) echo "Found Disco (Ubuntu 19.04)"; debian_install_on_disco;;
    bionic) echo "Found Bionic (Ubuntu 18.04)"; debian_install_on_bionic;;
    xenial) echo "Found Xenial (Ubuntu 16.04)"; debian_install_on_xenial;;
    trusty) echo "Found trusty (Ubuntu 14.04)"; debian_install_on_trusty;;
    *) throw_unsupported_distrobution;;
esac
}

function detect_debian_release() {
case $(lsb_release -cs) in
    stretch) echo "Found Debian Stretch"; debian_install_on_stretch;;
    jessie) echo "Found Debian Jessie"; debian_install_on_jessie;;
    *) throw_unsupported_distrobution;;
esac
}

function detect_deepin_release() {
case $(lsb_release -cs) in
    unstable) echo "Found Deepin Unstable"; deepin_install_on_unstable;;
    stable) echo "Found Deepin Stable"; deepin_install_on_stable;;
    *) throw_unsupported_distribution;;
esac
}


function detect_linux_distribution {
echo "
Detecting OS
";

if command -v lsb_release;
then
    echo "Found lsb_release";
else
    echo "lsb_release is not installed";
    throw_unsupported_distrobution;
fi;

case $( lsb_release -is) in
    Ubuntu) detect_ubuntu_release;;
    Debian) detect_debian_release;;
    Deepin) detect_deepin_release;;
    *) throw_unsupported_distrobution;;
esac
}
