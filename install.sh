# this is a complete setup post-install script

sudo dnf install sway # window manager
sudo dnf install foot # blazingly fast and lightweight wayland terminal emulator
sudo dnf install swaybar # status bar for sway
sudo dnf install i3-status # status line generator

# neovim
sudo dnf install neovim
# packer -- neovim plugin manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo dnf install ripgrep # used for live grep in telescope.nvim
nvim +PackerInstall +q # install plugins and quit

# web browser
sudo dnf install firefox # should be pre-installed

# rust 
