#!/bin/sh

#rpm-fusion repositories
#only works in bash
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install sway
sudo dnf install waybar
sudo dnf install foot
sudo dnf install fuzzel
sudo dnf install blueman
sudo dnf install network-manager-applet
sudo dnf install trash-cli
sudo dnf install mako



#neovim
sudo dnf install neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#dracula gtk theme
wget https://github.com/dracula/gtk/archive/master.zip
sudo unzip master.zip -d /usr/share/themes
gsettings set org.gnome.desktop.interface gtk-theme "gtk-master"
gsettings set org.gnome.desktop.wm.preferences theme "gtk-master"
rm master.zip

#dracula icon theme
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
sudo unzip Dracula.zip -d /usr/share/themes
gsettings set org.gnome.desktop.interface icon-theme "Dracula"
rm Dracula.zip

#zsh
sudo dnf install zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"  #oh-my-zsh
#create symlinks for zsh themeing and customization
rm ~/.zshrc
ln -s ~/.config/oh-my-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
ln -s ~/.config/oh-my-zsh/lib ~/.oh-my-zsh/themes/lib
ln -s ~/.config/oh-my-zsh/.zshrc ~/.zshrc
chsh -s $(which zsh)
