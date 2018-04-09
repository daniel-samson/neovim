function debian_install_rust_env {
read -p "Would you like to install the rust environment (y/n)?" choice
case "$choice" in
  y|Y )
    run_command "curl -sS https://sh.rustup.rs -o install_rust.sh";
    run_command "chmod a+x install_rust.sh";
    run_command "./install_rust.sh";
    if grep -q "source $HOME/.cargo/env" ~/.bash_aliases;
        then
            echo "Cargo configured";
        else
            echo "source $HOME/.cargo/env" >> ~/.bash_aliases;
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
