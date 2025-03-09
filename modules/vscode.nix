{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true; # Enable VSCode in Home Manager

    # Install Extensions
    extensions = with pkgs.vscode-extensions; [
      haskell.haskell
      justusadam.language-haskell
      esbenp.prettier-vscode   # Prettier for formatting
      eamodio.gitlens          # GitLens for Git history
      sdras.night-owl          # Night Owl Theme
	  bbenoist.nix			   # Nix language support
    ];

    # Set VSCode User Settings
    userSettings = {
	  "editor.fontSize" = 12;
	  "editor.fontFamily" = "Fira Code, JetBrains Mono, Consolas, 'Courier New', monospace";
	  "editor.tabSize" = 4;
	  "editor.wordWrap" = "on";
	  "workbench.colorTheme" = "Night Owl";
	  "editor.formatOnSave" = true;
	  "files.autoSave" = "afterDelay";
	  "editor.minimap.enabled" = true;
	  "terminal.integrated.fontSize" = 10;

	  # Define custom Bash profile for VS Code terminal
	  "terminal.integrated.profiles.linux" = {
		"custom-bash" = {
		  "path" = "bash";
		  "icon" = "terminal-bash";
		  "overrideName" = true;
		};
	  };

	  "terminal.integrated.defaultProfile.linux" = "custom-bash";
	  "git.autofetch" = true;

	  # Haskell Language Server Paths
	  "haskell.serverExecutablePath" = "/nix/store/hdijzd8md5nx54q9qy13yf36h9zlr78m-haskell-language-server-2.9.0.0/bin/haskell-language-server";
	  "haskell.serverExecutablePathFallback" = "${pkgs.haskell-language-server}/bin/haskell-language-server";
	};
  };
}
