#!/bin/bash
set -e
SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
BUILD_PATH=$(realpath ./.build);
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
echo "function build_config {
    mkdir -p ~/.config/nvim/;
    echo \"" >> $BUILD_PATH/$INSTALL_SCRIPT;
cat $NVIM_CONFIG_PATH/* >> $BUILD_PATH/$INSTALL_SCRIPT;
echo "\" >> ~/.config/nvim/init.vim;" >> $BUILD_PATH/$INSTALL_SCRIPT;
echo "}" >> $BUILD_PATH/$INSTALL_SCRIPT;

# Build Install functions
cd $SRC_PATH;
cat **/* detect_os.sh install.sh >> $BUILD_PATH/$INSTALL_SCRIPT;
cd $SCRIPTPATH;
mv $BUILD_PATH/$INSTALL_SCRIPT $INSTALL_SCRIPT;
chmod a+x $INSTALL_SCRIPT;
