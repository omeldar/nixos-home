{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./users.nix
    ./networking.nix
    ./packages.nix
    ./desktop.nix
    ./services.nix
    ./system.nix
    ./nix-settings.nix
    <home-manager/nixos>
  ];
  
  home-manager.users.akotami = import /etc/nixos/modules/home.nix;

  system.stateVersion = "24.11"; # Be careful with this one, read the documentation online first!
}
