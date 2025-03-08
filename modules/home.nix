{
  config,
  pkgs,
  ...
}: {
  home.username = "akotami"; # Add your username
  home.homeDirectory = "/home/akotami"; # Set the home directory

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.11"; # Match your system's state version

  imports = [
    # ./vscode.nix
    ./wezterm.nix
  ];

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      screenshot = ["flameshot gui"];
    };
  };

  # Make sure it starts on startup
  systemd.user.services.flameshot = {
    Unit = {
      Description = "Flameshot Screenshot Tool";
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${pkgs.flameshot}/bin/flameshot";
      Restart = "always";
    };

    Install = {
      WantedBy = ["default.target"];
    };
  };
}
