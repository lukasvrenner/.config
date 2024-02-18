#!/usr/bin/sh
# installs everything it can without root

# symlink bash configs
path_to_script=dirname $0

ln -s $path_to_script/.bashrc ~/.bashrc
ln -s $path_to_script/.bash_profile ~/.bash_profile

if  ls /usr/bin/nvim; 
then
    # paq-nvim -- neovim plugin manager
    git clone --depth=1 https://github.com/savq/paq-nvim.git \
        "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

    nvim +PaqInstall +q # install plugins and quit
fi

# rust
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

