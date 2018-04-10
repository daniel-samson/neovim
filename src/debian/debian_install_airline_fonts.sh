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
