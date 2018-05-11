function throw_unsupported_distrobution() {
echo "Unsupported distribution version/codename";
echo $(lsb_release -a);
exit 1;
}


function detect_ubuntu_release() {
case $(lsb_release -cs) in
    xenial) echo "Found Xenial (Ubuntu 16.04)"; debian_install_on_xenial;;
    trusty) echo "Found trusty (Ubuntu 14.04)"; debian_install_on_trusty;;
esac
}

function detect_debian_release() {
case $(lsb_release -cs) in
    stretch) echo "Found Debian Stretch"; debian_install_on_stretch;;
    jessie) echo "Found Debian Jessie"; debian_install_on_jessie;;
esac
}

function detect_deepin_release() {
case $(lsb_release -cs) in
    unstable) echo "Found Deepin Unstable"; deepin_install_on_unstable;;
esac
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

case $( lsb_release -is) in
    Ubuntu) detect_ubuntu_release;;
    Debian) detect_debian_release;;
    Deepin) detect_deepin_release;;
    *) throw_unsupported_distrobution;;
esac
}
