{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # productivity
    vim
    wget
    htop
    liquidctl
    git
    statix
    nix-tree
    nix-template
    alejandra # Nix formatter
    notepadqq
    brave
    wezterm
	vscode
	flameshot
	direnv

    # entertainment
    discord
    spotify
	
	# Add Haskell Language Server (system-wide for fallback)
	haskell-language-server
  ];
}
