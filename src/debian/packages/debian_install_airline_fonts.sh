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
