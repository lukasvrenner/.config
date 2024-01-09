#!/usr/bin/sh
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

# efficient status bar generator
install i3status

# blazingly fast and lightweight wayland terminal emulator
install foot

# a heavily refactored vim fork
alt_install neovim nvim
# if neovim is installed or successfully installs,
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

# development 
install gh

# note: will require user input to complete
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo component add rust-analyzer # LSP

# file managers
install nnn # terminal
install Thunar # GTK
