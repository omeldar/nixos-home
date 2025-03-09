{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./users.nix
    ./networking.nix
    ./packages.nix
    ./desktop.nix
	./system.nix
    ./services.nix
    ./nix-settings.nix
    <home-manager/nixos>
  ];
  
  # Configure home-manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.akotami = import /etc/nixos/modules/home.nix;	# Set config for user akotami

  system.stateVersion = "24.11"; # Be careful with this one, read the documentation online first!
}
