{ config, pkgs, ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;  # Enables integration with Nix
  };
}
