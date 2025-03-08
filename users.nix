{
  config,
  pkgs,
  ...
}: {
  users.users.akotami = {
    isNormalUser = true;
    description = "akotami";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
