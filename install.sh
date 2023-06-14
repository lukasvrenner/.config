#!/bin/sh

sudo dnf install sway
sudo dnf install waybar
sudo dnf install xfce4-terminal
sudo dnf install fuzzel
sudo dnf install blueman
sudo dnf install network-manager-applet
sudo dnf install trash-cli


#zsh
sudo dnf install zsh
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"  #oh-my-zsh
#add oh-my-zsh theme stuff here

#neovim
sudo dnf install neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#dracula gtk theme
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip -d /usr/share/themes
gsettings set org.gnome.desktop.interface gtk-theme "gtk-master"
gsettings set org.gnome.desktop.wm.preferences theme "gtk-master"
rm master.zip

#dracula icon theme
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip Dracula.zip -d /usr/share/themes
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
rm Dracula.zip
