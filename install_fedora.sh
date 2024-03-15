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

# symlink bash configs
path_to_script=dirname $0

ln -s $path_to_script/.bashrc ~/.bashrc
ln -s $path_to_script/.bash_profile ~/.bash_profile

# window manager
install sway
install swaybar # status bar for sway

# efficient status bar generator
install i3status

# application launch
install bemenu 

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

    nvim +PaqInstall +q # install plugins and quit

    alt_install ripgrep rg # a grep-like program used by telescope.nvim for text search
fi

# web browser
install firefox

# development 
install gh

# note: will require user input to complete
echo "installing Rust requires downloading and executing a script from the web"
echo "this is a potential security risk"
read -p "would you like to continue? (y/N)" confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
then
    echo "installing Rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    cargo component add rust-analyzer # LSP
else
    echo "Rust was not installed"

# file managers
install nnn # terminal
install Thunar # GTK
