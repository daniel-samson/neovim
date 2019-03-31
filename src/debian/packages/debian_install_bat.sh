function install_bat_download {
run_command_as_root "pgkg -i bat-musl_0.10.0_amd64.deb";
}

function debian_install_bat {
echo "Installing bat";
HACK_FONT_URL="https://github.com/sharkdp/bat/releases/download/v0.10.0/bat-musl_0.10.0_amd64.deb";

if command -v curl
then
    run_command "curl -L -O ${HACK_FONT_URL}";
    debian_extract_hack_font;
elif command -v wget
then
    run_command "wget ${HACK_FONT_URL}";
    debian_extract_hack_font;
else
    echo "cannot download bat";
fi
}
