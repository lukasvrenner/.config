{ config, pkgs, ...}:
{
home.username = "lukas";
home.homeDirectory = "/home/lukas";
home.stateVersion = "23.05";
programs.home-manager.enable = true;
 
home.packages = with pkgs; [
nodejs
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

gtk = {
    enable = true;
    theme = {
        name = "Dracula";
        package = pkgs.dracula-theme;
    };
    iconTheme = {
        name = "Dracula";
        package = pkgs.dracula-icon-theme;
    };
    cursorTheme = {
    name = "Dracula-cursors";
    package = pkgs.dracula-theme;
    };
};
 
}
 
