#!/usr/bin/sh
# REQUIRES ROOT 
# *NOT* distro-agnostic -- requires RHEL-based distro 
# if you want a rootless install, use rootless_install.sh

# install () {
#     echo "installing $1"
#     if ls /usr/bin/$1; # checks if installed to boost speed if it isn't
#     then echo "$1 is already installed"
#     else sudo dnf install $1
#     fi
# }
#
# # sometimes, the executable has a different name from the package
# alt_install () {
#     echo "installing $1"
#     if ls /usr/bin/$2;
#     then echo "$1 is already installed"
#     else sudo dnf install $1;
#     fi
# }

# symlink bash configs
path=dirname $0

ln -s $path/.bashrc ~/.bashrc
ln -s $path/.bash_profile ~/.bash_profile

install=()

# window manager
install+='sway'
install+='swaybar' # status bar for sway

# efficient status bar generator
install+='i3status'

# application launch
install+='wmenu' 

# blazingly fast and lightweight wayland terminal emulator
install+='foot'

# a heavily refactored vim fork
install+='neovim'
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

nvim +PaqInstall +q # install plugins and quit

install+=ripgrep

# web browser
install+='firefox'

# development 
install+='gh'

# note: will require user input to complete
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
then
    echo "installing Rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    cargo component add rust-analyzer # LSP
else
    echo "Rust was not installed"

# file managers
install+=nnn # terminal
install+=Thunar # GTK

install+=clang
install+=clang-tools-extra
install+=clang-analyzer

sudo dnf install ${install[*]}
