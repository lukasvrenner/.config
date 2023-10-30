#!/usr/bin/bash
# this is a complete setup post-install script
# REQUIRES ROOT 
# if you want a rootless install, use rootless_install.sh

install () {
    echo "installing $1"
    if ls /usr/bin/ | grep -q $1; # checks if installed to boost speed if it isn't
    then echo "$1 is already installed"
    else sudo dnf install $1
    fi
}

# sometimes, the executable has a different name from the package
alt_install () {
    echo "installing $1"
    if ls /usr/bin | grep -q $2;
    then echo "$1 is already installed"
    else sudo dnf install $1;
    fi
}

# window manager
install sway
install swaybar # status bar for sway

# super efficient status bar generator
install i3status

# blazingly fast and lightweight wayland terminal emulator
install foot

# neovim
alt_install neovim nvim
# if it is installed or successfully installs,
# then we can install plugin dependencies
if  ls /usr/bin/ | grep -q nvim; 
then
    # packer -- neovim plugin manager
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    nvim +PackerInstall +q # install plugins and quit
    alt_install ripgrep rg # a grep-like program used by telescope.nvim for text search
fi

# web browser
install firefox

# rust 
install cargo # package manager
install rustc # compiler
