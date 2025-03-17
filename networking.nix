{
  config,
  pkgs,
  ...
}: {
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # NordVPN
  # services.openvpn.servers.nordvpn = {
  #   config = "config /etc/openvpn/ch217.nordvpn.com.udp.ovpn";
  #   autoStart = true;
  # };

  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openvpn
  ];
}
