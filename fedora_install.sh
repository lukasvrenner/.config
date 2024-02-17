#!/usr/bin/sh
# REQUIRES ROOT 
# *NOT* distro-agnostic -- requires RHEL-based distro 
# if you want a rootless install, use rootless_install.sh

install () {
    echo "installing $1"
    if ls /usr/bin/$1; # checks if installed to boost speed if it isn't
    then echo "$1 is already installed"
    else sudo dnf install $1
    fi
}

# sometimes, the executable has a different name from the package
alt_install () {
    echo "installing $1"
    if ls /usr/bin/$2;
    then echo "$1 is already installed"
    else sudo dnf install $1;
    fi
}

ln -s ~/.config/.bashrc ~/.bashrc
ln -s ~/.config/.bash_profile ~/.bash_profile

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
if  ls /usr/bin/nvim; 
then
    # paq-nvim -- neovim plugin manager
    git clone --depth=1 https://github.com/savq/paq-nvim.git \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

    # temporarily rename plugin directory
    # so that we don't get any errors for PaqInstall
    # note that this is a poor workaround
    path=dirname "$0"
    mv $path/nvim/plugin $path/nvim/plugin.bak
    nvim +PaqInstall +q # install plugins and quit
    mv $path/nvim/plugin.bak $path/nvim/plugin

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
