#!/bin/bash
set -e


function build_config {
h=$HOME
run_command "mkdir -p $h/.config/nvim/"
run_command "curl -sS
    https://raw.githubusercontent.com/daniel-samson/neovim/master/.config/nvim/init.vim -o $h/.config/nvim/init.vim"
}
function finish_install {
echo "nvim is configured and installed";
}
#!/bin/bash
function run_command_as_root(){
COMMAND=$1;
if [[ $(id -u) -eq 0 ]];
then
    echo $COMMAND;
    $COMMAND
elif command -v sudo;
then
    echo "sudo $COMMAND";
    sudo $COMMAND;
elif command -v su;
then
    echo "su -c \"$COMMAND\"";
    su -c "$COMMAND";
else
    print "Error: unable to run command $COMMAND as root";
    exit 1;
fi
}
#!/bin/bash
function run_command(){
COMMAND=$1;
echo $COMMAND;
$COMMAND
}
function neovim_install_plugins {
run_command "nvim +PlugInstall +UpdateRemotePlugins +qa";
}
function neovim_install_plug_manager {
h=$HOME;
run_command "curl -fLo $h/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
}
function debian_apt_update {
run_command_as_root "apt update";
}
function debian_extract_hack_font {
    sudo unzip Hack-v3.000-ttf.zip -d /usr/share/fonts
    fc-cache
}

function debian_install_airline_fonts {
if [ -f /usr/share/fonts/ttf/Hack-Regular.ttf ]
then
    echo "Found hack font"
else
    echo "Installing hack font"
    HACK_FONT_URL="https://github.com/source-foundry/Hack/releases/download/v3.000/Hack-v3.000-ttf.zip"

    if command -v curl
    then
        curl -L -O ${HACK_FONT_URL}
        extract_hack_font_debian
    elif command -v wget
    then
        wget ${HACK_FONT_URL}
        extract_hack_font_debian
    else
        echo "cannot download hack font"
    fi
fi
}
function debian_install_clipboard {
    run_command_as_root "apt-get install xsel";
}
function debian_install_curl {
run_command_as_root "apt-get install -y curl";
}
function debian_install_exuberant_ctags {
run_command_as_root "apt-get install -y exuberant-ctags";
}
function debian_install_git {
run_command_as_root "apt install -y git";
}
function debian_install_neovim {
run_command_as_root "apt-get install -y neovim";
}
function debian_install_neovim_xenial {
run_command_as_root "add-apt-repository ppa:neovim-ppa/stable";
run_command_as_root "apt-get update";
run_command_as_root "apt-get install -y neovim";
}
function debian_install_nodejs_env {
read -p "Would you like to install the nodejs/typescript environment (y/n)?" choice
case "$choice" in
  y|Y )
        run_command "curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh";
        run_command "chmod a+x nodesource_setup.sh";
        run_command_as_root "./nodesource_setup.sh";
        run_command_as_root "npm install -g typescript";
        run_command_as_root "apt-get install -y build-essential";
      ;;
  n|N )
      echo "OK, moving on."
      ;;
  * )
      debian_install_nodejs_env
      ;;
esac;

}
function debian_install_on_jessie {
    echo "Preparing to install on Debian Jessie";
    debian_apt_update;
    debian_install_git;
    debian_install_exuberant_ctags;
    debian_install_python_support;
    debian_install_neovim;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_airline_fonts;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
function debian_install_on_stretch {
    echo "Preparing to install on Debian Stretch";
    debian_apt_update;
    debian_install_exuberant_ctags;
    debian_install_git;
    debian_install_python_support;
    debian_install_neovim;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_airline_fonts;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
function debian_install_on_xenial {
    echo "Preparing to install on Ubuntu Xenial";
    debian_apt_update;
    debian_install_exuberant_ctags;
    debian_install_git;
    debian_install_python_support;
    debian_install_neovim_xenial;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_airline_fonts;
    build_config;
    neovim_install_plug_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
function debian_install_php_env {
read -p "Would you like to install the php environment (y/n)?" choice
case "$choice" in
  y|Y )
       run_command_as_root "apt install php-cli";
        run_command "curl -sS https://getcomposer.org/installer -o install_composer.sh";
        run_command_as_root "php install_composer.sh --install-dir=/usr/local/bin --filename=composer";
        run_command "composer global require friendsofphp/php-cs-fixer";
        run_command "composer global require phpmd/phpmd";
        run_command "composer global require leafo/scssphp";
        run_command "composer global require codeception/codeception";
        run_command "composer global require sebastian/phpcpd";
        # Install Composer Path
        COMPOSER=$(composer global config bin-dir --absolute);
        if grep -q "export PATH=\$PATH:$COMPOSER" ~/.bash_aliases;
        then 
            echo "Composer bin already configured";
        else 
            echo "export PATH=\$PATH:$COMPOSER" >> ~/.bash_aliases;
    fi
      ;;
  n|N ) echo "OK, moving on.";;
  * ) debian_install_php_env;;
esac;
}

function debian_install_python_support {
run_command_as_root "apt-get install -y python-pip python3-pip";
run_command_as_root "pip install neovim";
run_command_as_root "pip3 install neovim";
}
function debian_install_rust_env {
read -p "Would you like to install the rust environment (y/n)?" choice
case "$choice" in
  y|Y )
    run_command "curl -sS https://sh.rustup.rs -o install_rust.sh";
    run_command "chmod a+x install_rust.sh";
    run_command "./install_rust.sh";
    if grep -q "source \$HOME/.cargo/env" ~/.bash_aliases;
    then
            echo "Cargo configured";
        else
            echo "source \$HOME/.cargo/env" >> ~/.bash_aliases;
    fi
    if grep -q "export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src" ~/.bash_aliases;
        then
            echo "RUST_SRC_PATH configured";
        else
            echo "export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src" >> ~/.bash_aliases;
    fi

    run_command "rustup update";
    run_command "export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src";
    run_command "rustup install nightly";
    run_command "rustup component add rls-preview --toolchain nightly";
    run_command "rustup component add rust-analysis --toolchain nightly";
    run_command "rustup component add rust-src --toolchain nightly";
    run_command "cargo install racer --force";
    ;;
  n|N )
    echo "OK, moving on.";
    ;;
  * )
      debian_install_rust_env;
      ;;
esac;
}
function debian_replace_vim {
read -p "Would you like to replace vim with nvim (y/n)?" choice
case "$choice" in
  y|Y )
      run_command_as_root "rm -f /usr/local/bin/vim";
      run_command_as_root "ln -s /usr/bin/nvim /usr/local/bin/vim";
      ;;
  n|N ) echo "OK, You will need to run nvim instead of vim.";;
  * ) debian_replace_vim;;
esac;
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
finish_install
