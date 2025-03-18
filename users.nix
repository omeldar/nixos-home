{
  config,
  pkgs,
  ...
}: {
  users.users.akotami = {
    isNormalUser = true;
    home = "/home/akotami";
    description = "akotami";
    extraGroups = ["networkmanager" "wheel" "nordvpn"];
    group = "akotami";
  };

  users.groups.akotami = {};
}
