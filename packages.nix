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
    alejandra
    notepadqq
    brave
    wezterm

    # entertainment
    discord
    spotify
  ];
}
