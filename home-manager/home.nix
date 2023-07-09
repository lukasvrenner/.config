{ config, pkgs, ...}:
{
home.username = "lukas";
home.homeDirectory = "/home/lukas";
home.stateVersion = "23.05";
programs.home-manager.enable = true;
 
home.packages = [
];
 
programs.zsh = {
	enable = true;
	shellAliases = {
		l = "ls -l";
		update = "sudo nixos-rebuild switch";
	};
	history = {
		size = 10000;
		path = "${config.xdg.dataHome}/zsh/history";
	};
 
	oh-my-zsh = {
		enable = true;
		plugins = ["git" "thefuck"];
		theme = "eastwood";
	};
 
};
 
 
gtk.theme.name = "Dracula";
gtk.iconTheme = "Dracula";
gtk.cursorTheme = "Dracula";
}
 
