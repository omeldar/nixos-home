{
  config,
  pkgs,
  ...
}: {
  # Install firefox.
  programs.firefox.enable = true;

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
    alejandra
    notepadqq
    brave

    # entertainment
    discord
    spotify
  ];
}
