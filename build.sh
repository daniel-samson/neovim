#!/bin/bash
set -e
set -x

SCRIPT=$(realpath $0);
SCRIPTPATH=`dirname $SCRIPT`;
BUILD_PATH=$(realpath .)/.build;
INSTALL_SCRIPT=install.sh;
SRC_PATH=$(realpath ./src);
NVIM_CONFIG_PATH=$(realpath .config/nvim);

# Clean
rm -fr $BUILD_PATH;
mkdir -p $BUILD_PATH;


# Build installer
echo "#!/bin/bash
set -e

" > $BUILD_PATH/$INSTALL_SCRIPT;

# Build Config
echo "function build_config {" >> $BUILD_PATH/$INSTALL_SCRIPT;
    echo "h=\$HOME" >> $BUILD_PATH/$INSTALL_SCRIPT;
    echo "run_command \"mkdir -p \$h/.config/nvim/\"" >> $BUILD_PATH/$INSTALL_SCRIPT;
    # TODO: make next line more universal so that you don't need to install coreutils
    echo "run_command \"cp -r .config/nvim/ \$HOME/.config/nvim/\"" >> $BUILD_PATH/$INSTALL_SCRIPT;
echo "}" >> $BUILD_PATH/$INSTALL_SCRIPT;

# Build Install functions
cd $SRC_PATH;
cat utility/*.sh neovim/*.sh debian/utility/*.sh debian/packages/*sh debian/environments/*.sh debian/*.sh deepin/*.sh macos/packages/*.sh macos/environments/*.sh  macos/*.sh arch/packages/*.sh arch/environments/*.sh  arch/*.sh detect_linux_distribution.sh detect_os.sh install.sh >> $BUILD_PATH/$INSTALL_SCRIPT;
cd $SCRIPTPATH;
mv $BUILD_PATH/$INSTALL_SCRIPT $INSTALL_SCRIPT;
chmod a+x $INSTALL_SCRIPT;
bash -n $INSTALL_SCRIPT;
