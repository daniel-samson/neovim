# NeoVim IDE

A distribution of nvim, configured as an "Integrated" Development Environment (IDE). The commands in this project are kept behind the `g` key, so that it doesn't override the key bindings you expect, including your leader key bindings.

![neovim-demo](https://user-images.githubusercontent.com/12231216/190848962-1fe609e9-e258-4524-9e74-0e12a1312b8c.gif)


## Project Status
[![build](https://github.com/daniel-samson/neovim/actions/workflows/build.yml/badge.svg)](https://github.com/daniel-samson/neovim/actions/workflows/build.yml)

## Features:

- Easy Project Nagivation
- Project Explorer
- Syntax Highting
- Auto Completion
- Auto save / reload
- Search Project files, commands, tags, and github history
- Debug your code
- Mouse support

## Requirements
- Stable internet connection
- Supported OS

## Supported OS

The install script will only let you install on these distribution of linux using premade recipes.

- MacOS
- Arch Linux
- Debian Stretch, Jessie
- Ubuntu 20.04, 19.04, 18.04, 16.04, 14.04
- KDE Neon 16.04, 14.04
- Deepin Unstable, Stable

## Installation:
Installs the latest version of NeoVim and configures NeoVim to used as an IDE. If you have already set up neovim before, then this will overwrite your init.lua file.

**Using git:**
<pre>
git clone https://github.com/daniel-samson/neovim
cd neovim
chmod u+x ./install.sh
./install.sh
</pre>

## Usage:
- cd /path/to/project/
- nvim 

## Documentation
- [Keyboard Shortcuts/Bindings](KEYBINDING.md)

## Hot Reloading Configuration
You can reload your config file by using the `:ReloadConfig` command.

## Customization

Please edit the `.config/nvim/lua/init.user.lua` instead of `init.lua`, so that you can keep you customizations during upgrades.
