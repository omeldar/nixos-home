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

    # entertainment
    discord
    spotify
  ];
}
