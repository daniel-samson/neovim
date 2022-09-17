#!/bin/bash
set -e


function build_config {
h=$HOME
run_command "mkdir -p $h/.config/nvim/"
run_command "cp .config/nvim/init.lua $HOME/.config/nvim/"
if [ ! -d "$h/.config/nvim/lua" ]; then
run_command "mkdir -p $h/.config/nvim/lua"
run_command "cp .config/nvim/lua/init-user.lua $h/.config/nvim/lua/"
fi
}
function config_global_gitignore {
    read -p "Would you like to setup global git ignore (y/n)?" choice
    case "$choice" in
    y|Y)
        h=$HOME
        gifile=".gitignore_global"
        run_command "touch $h/$gifile";
        run_command "git config --global core.excludesfile $h/$gifile";
        echo .vim/ >> $h/$gifile
        echo .vimrc >> $h/$gifile
        echo .vimrc/ >> $h/$gifile
        echo tags >> $h/$gifile
        ;;
    n|N )
        echo "OK, moving on.";
        ;;
    *)
        macos_install_nodejs_env;
        ;;
    esac;
}
function finish_install {
echo "nvim is configured and installed";
}
#!/bin/bash
function run_command(){
COMMAND=$1;
echo " "
echo "Running command: $COMMAND";
$COMMAND
echo " "
}
#!/bin/bash
function run_command_as_root(){
COMMAND=$1;
if [[ $(id -u) -eq 0 ]];
then
    run_command $COMMAND;
elif command -v sudo;
then
    run_command "sudo $COMMAND";
elif command -v su;
then
    run_commmand "su -c $COMMAND";
else
    print "Error: unable to run command $COMMAND as root";
    exit 1;
fi
}
function neovim_install_paq_manager {
h=$HOME;
if [ ! -d $h/.local/share/nvim/site/pack/paqs/start/paq-nvim ]; then
run_command "git clone --depth=1 https://github.com/savq/paq-nvim.git $h/.local/share/nvim/site/pack/paqs/start/paq-nvim";
fi
}
function neovim_install_plug_manager {
h=$HOME;
run_command "curl -fLo $h/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
}
function neovim_install_plugins {
run_command "nvim +PaqInstall +qa";
}
function debian_apt_update {
run_command_as_root "apt update";
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
function debian_extract_hack_font {
    run_command_as_root "unzip Hack-v3.000-ttf.zip -d /usr/share/fonts"
    run_command "fc-cache"
}

function debian_install_airline_fonts {
if [ -f /usr/share/fonts/ttf/Hack-Regular.ttf ]
then
    echo "Found hack font"
else
    echo "Installing hack font";
    HACK_FONT_URL="https://github.com/source-foundry/Hack/releases/download/v3.000/Hack-v3.000-ttf.zip";

    if command -v curl
    then
        run_command "curl -L -O ${HACK_FONT_URL}";
        debian_extract_hack_font;
    elif command -v wget
    then
        run_command "wget ${HACK_FONT_URL}";
        debian_extract_hack_font;
    else
        echo "cannot download hack font";
    fi
fi
}
function install_bat_download {
run_command_as_root "dpkg -i bat-musl_0.14.0_amd64.deb";
}

function debian_install_bat {
echo "Installing bat";
BAT_URL="https://github.com/sharkdp/bat/releases/download/v0.14.0/bat-musl_0.14.0_amd64.deb";
if command -v curl
then
    run_command "curl -L -O ${BAT_URL}";
    install_bat_download;
elif command -v wget
then
    run_command "wget ${BAT_URL}";
    install_bat_download;
else
    echo "cannot download bat";
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
config_global_gitignore
}
function debian_install_neovim {
    run_command_as_root "apt-get install -y neovim";
}
function debian_install_neovim_disco {
run_command_as_root "apt-get update";
run_command_as_root "apt-get install -y neovim";
}
function debian_install_neovim_trusty {
run_command_as_root "add-apt-repository -y ppa:neovim-ppa/stable";
run_command_as_root "apt-get update";
run_command_as_root "apt-get install -y neovim";
}
function debian_install_neovim_xenial {
run_command_as_root "add-apt-repository -y ppa:neovim-ppa/stable";
run_command_as_root "apt-get update";
run_command_as_root "apt-get install -y neovim";
}
function debian_install_python_support {
run_command_as_root "apt-get install -y python-pip python3-pip";
run_command_as_root "apt-get install -y build-essential libssl-dev libffi-dev";
run_command_as_root "apt-get install -y python-dev python3-venv";
run_command_as_root "pip install neovim";
run_command_as_root "pip3 install neovim";
PYENV="$HOME/.python_env";
run_command "mkdir -p $PYENV";
run_command "cd $PYENV";
run_command "python3 -m venv test_env";
if grep -q "source $PYENV/test_env" ~/.bash_aliases;
then
    echo "Python connfigured";
else
    echo "source $PYENV/test_env" >> ~/.bash_aliases;
fi
}
function focal_install_python_support {
run_command_as_root "apt install -y python3-pip";
run_command_as_root "apt install -y build-essential libssl-dev libffi-dev";
run_command_as_root "apt install -y python-dev python3-venv";
run_command_as_root "pip3 install neovim";
PYENV="$HOME/.python_env";
run_command "mkdir -p $PYENV";
run_command "cd $PYENV";
run_command "python3 -m venv test_env";
if grep -q "source $PYENV/test_env" ~/.bash_aliases;
then
    echo "Python connfigured";
else
    echo "source $PYENV/test_env" >> ~/.bash_aliases;
fi
}
function debian_install_haskell_env {
read -p "Would you like to install the haskell environment (y/n)?" choice
case "$choice" in
  y|Y )
    run_command "curl -sS https://get.haskellstack.org/ -o install_haskell.sh";
    run_command "chmod a+x install_haskell.sh";
    run_command "./install_haskell.sh -f";
    ;;
  n|N )
    echo "OK, moving on.";
    ;;
  * )
      debian_install_haskell_env;
      ;;
esac;
}
function debian_install_nodejs_env {
read -p "Would you like to install the nodejs/typescript environment (y/n)?" choice
case "$choice" in
  y|Y )
        run_command "curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh";
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
function debian_install_php_env {
read -p "Would you like to install the php environment (y/n)?" choice
case "$choice" in
  y|Y )
        run_command_as_root "apt install php-cli php-dom php-gd php-json php-openssl";
        run_command "curl -sS https://getcomposer.org/installer -o install_composer.sh";
        run_command_as_root "php install_composer.sh --install-dir=/usr/local/bin --filename=composer";
        run_command "composer global require friendsofphp/php-cs-fixer";
        run_command "composer global require phpmd/phpmd";
        run_command "composer global require leafo/scssphp";
        run_command "composer global require codeception/codeception";
        run_command "composer global require sebastian/phpcpd";
        run_command "composer global require phpbench/phpbench";
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

function debian_install_php_env_bionic {
read -p "Would you like to install the php environment (y/n)?" choice
case "$choice" in
  y|Y )
        run_command_as_root "apt install -y php-cli php-dom php-mbstring php-gd";
        run_command_as_root "apt install -y php-curl";
        run_command "curl -sS https://getcomposer.org/installer -o install_composer.sh";
        run_command_as_root "php install_composer.sh --install-dir=/usr/local/bin --filename=composer";
        run_command_as_root "chown -R $USER $HOME/.composer"
        run_command "composer global require friendsofphp/php-cs-fixer";
        run_command "composer global require phpmd/phpmd";
        run_command "composer global require leafo/scssphp";
        run_command "composer global require codeception/codeception";
        run_command "composer global require sebastian/phpcpd";
        run_command "composer global require phpbench/phpbench";
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
function debian_install_on_bionic {
    echo "Preparing to install on Ubuntu Xenial";
    debian_apt_update;
    debian_install_exuberant_ctags;
    debian_install_git;
    debian_install_python_support;
    debian_install_neovim_xenial;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_replace_vim;
    debian_install_php_env_bionic;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
    neovim_install_plugins;
}
function debian_install_on_disco {
    echo "Preparing to install on Ubuntu Disco";
    debian_apt_update;
    debian_install_exuberant_ctags;
    debian_install_git;
    debian_install_python_support;
    debian_install_neovim_disco;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_replace_vim;
    debian_install_php_env_bionic;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
    neovim_install_plugins;
}
function debian_install_on_focal {
    echo "Preparing to install on Ubuntu Focal";
    debian_apt_update;
    debian_install_exuberant_ctags;
    debian_install_git;
    focal_install_python_support;
    debian_install_neovim_disco;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_replace_vim;
    debian_install_php_env_bionic;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
    neovim_install_plugins;
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
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
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
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
    debian_replace_vim;
    neovim_install_plugins;
}
function debian_install_on_trusty {
    echo "Preparing to install on Ubuntu Trusty";
    debian_apt_update;
    debian_install_git;
    debian_install_exuberant_ctags;
    debian_install_python_support;
    debian_install_neovim_trusty;
    debian_install_curl;
    debian_install_clipboard;
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
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
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_replace_vim;
    debian_install_php_env;
    debian_install_rust_env;
    debian_install_nodejs_env;
    debian_install_haskell_env;
    neovim_install_plugins;
}
function deepin_install_on_stable {
    echo "Preparing to install on Deepin Stable";
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
    debian_install_haskell_env;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    deepin_replace_vim;
}
function deepin_install_on_unstable {
    echo "Preparing to install on Deepin Unstable";
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
    debian_install_haskell_env;
    debian_install_airline_fonts;
    debian_install_bat;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    debian_replace_vim;
}
function deepin_replace_vim {
read -p "Would you like to replace vim with nvim (y/n)?" choice
case "$choice" in
  y|Y )
      run_command_as_root "rm -f /usr/bin/vim";
      run_command_as_root "ln -s /usr/bin/nvim /usr/bin/vim";
      ;;
  n|N ) echo "OK, You will need to run nvim instead of vim.";;
  * ) deepin_replace_vim;;
esac;
}
function macos_install_bat() {
    run_command "brew install bat";
}
function macos_install_git {
    run_command "brew install git";
}
function macos_install_homebrew() {
    if command -v brew;
    then
        echo "homebrew is installed";
    else
        run_command "curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh";
    fi;
}
function macos_install_neovim() {
    run_command "brew install neovim";
}
function macos_install_python3() {
    if command -v python3;
    then
        echo "Found python3 is installed";
        echo "Found python3 is installed";
    else
        run_command "brew install python3";
        run_command "python3 -m pip install setuptools";
        run_command "python3 -m pip install upgrade pynvim";
    fi;
}
function macos_install_ripgrep() {
    run_command "brew install ripgrep";
}
function macos_install_xcode() {
    if command -v brew;
    then
        echo "Assuming xcode is installed";
    else
        run_command "xcode-select --install";
    fi;
}
function macos_install_nodejs_env () {
    
    read -p "Would you like to install the nodejs environment (y/n)?" choice
    case "$choice" in
    y|Y)
        run_command "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"
        run_command "nvm install node"
        run_command "nvm use node"
        run_command "nvm alias default node"
        ;;
    n|N )
        echo "OK, moving on.";
        ;;
    *)
        macos_install_nodejs_env;
        ;;
    esac;
}
function macos_install_rust_env() {
      read -p "Would you like to install the rust environment (y/n)?" choice
    case "$choice" in
    y|Y)
        run_command "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh";
        ;;
    n|N)
        echo "OK, moving on.";
        ;;
    *)
        macos_install_nodejs_env;
        ;;
    esac;   
}
function install_on_macos() {
    macos_install_xcode;
    macos_install_homebrew;
    macos_install_ripgrep;
    macos_install_bat;
    macos_install_neovim;
    macos_install_python3;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    macos_install_rust_env;
    macos_install_nodejs_env;
    config_global_gitignore;
}
function arch_install_bat() {
    run_command_as_root "pacman -S --noconfirm bat"
}
function arch_install_curl() {
    run_command_as_root "pacman -S --noconfirm curl"
}
function arch_install_neovim() {
    run_command_as_root "pacman -S --noconfirm neovim"
}
function arch_install_ripgrep() {
    run_command_as_root "pacman -S --noconfirm ripgrep"
}
function arch_install_nodejs_env () {
    read -p "Would you like to install the nodejs environment (y/n)?" choice
    case "$choice" in
    y|Y)
        run_command "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"
        run_command "nvm install node"
        run_command "nvm use node"
        run_command "nvm alias default node"
        ;;
    n|N )
        echo "OK, moving on.";
        ;;
    *)
        arch_install_nodejs_env;
        ;;
    esac;
}
function arch_install_rust_env() {
      read -p "Would you like to install the rust environment (y/n)?" choice
    case "$choice" in
    y|Y)
        run_command "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh";
        ;;
    n|N)
        echo "OK, moving on.";
        ;;
    *)
        arch_install_rust_env;
        ;;
    esac;   
}
function arch_install_on_arch() {
    run_command_as_root "pacman -Sy";
    arch_install_ripgrep;
    arch_install_bat;
    arch_install_neovim;
    build_config;
    neovim_install_paq_manager;
    neovim_install_plugins;
    arch_install_rust_env;
    arch_install_nodejs_env;
    config_global_gitignore;
}
function throw_unsupported_distribution() {
echo "Unsupported distribution version/codename";
echo $(lsb_release -a);
exit 1;
}

function detect_arch_release() {
    arch_install_on_arch
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
    throw_unsupported_distribution;
fi;

case $( lsb_release -is) in
    Arch) detect_arch_release;;
    Ubuntu) detect_ubuntu_release;;
    Debian) detect_debian_release;;
    Deepin) detect_deepin_release;;
    *) throw_unsupported_distribution;;
esac
}
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
detect_os;

case $OS in 
    Linux) detect_linux_distribution ;;
    MacOs) install_on_macos ;;
esac

finish_install
