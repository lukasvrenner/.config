#!/bin/sh

dnf install sway
dnf install waybar
dnf install xfce4-terminal
dnf install fuzzel
dnf install blueman
dnf install network-manager-applet
dnf install trash-cli


#zsh
dnf install zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"  #oh-my-zsh
#add oh-my-zsh theme stuff here

#neovim
dnf install neovim
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
