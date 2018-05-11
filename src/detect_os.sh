
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
        lsb_release -a;
        exit 1;
        ;;
esac

}
