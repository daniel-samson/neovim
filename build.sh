#!/bin/bash
set -e
SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
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
    echo "run_command \"curl -sS
    https://raw.githubusercontent.com/daniel-samson/neovim/master/.config/nvim/init.vim -o \$h/.config/nvim/init.vim\"" >> $BUILD_PATH/$INSTALL_SCRIPT;
echo "}" >> $BUILD_PATH/$INSTALL_SCRIPT;

# Build Install functions
cd $SRC_PATH;
cat utility/*.sh neovim/*.sh debian/*.sh deepin/*.sh detect_os.sh install.sh >> $BUILD_PATH/$INSTALL_SCRIPT;
cd $SCRIPTPATH;
mv $BUILD_PATH/$INSTALL_SCRIPT $INSTALL_SCRIPT;
chmod a+x $INSTALL_SCRIPT;
bash -n $INSTALL_SCRIPT;
