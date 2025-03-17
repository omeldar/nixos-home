{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.username = "akotami"; # Add your username
  home.homeDirectory = "/home/akotami"; # Set the home directory

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.11"; # Match your system's state version

  imports = [
    ./modules/vscode.nix
    ./modules/wezterm.nix
    ./modules/direnv.nix
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
      ExecStartPost = "${pkgs.flameshot}/bin/flameshot --tray"; # Start in tray mode
    };

    Install = {
      WantedBy = ["default.target"];
    };
  };
}
