{
  config,
  pkgs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Home Manager as a NixOS module
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users.akotami = {
      home.stateVersion = "24.11"; # Keep the same as system.stateVersion

      xdg.configFile."wezterm/wezterm.lua".text = ''
        return {
          font = wezterm.font("JetBrains Mono"),
          font_size = 14.0,
          color_scheme = "Catppuccin Mocha",
          window_background_opacity = 0.85,
          text_background_opacity = 0.85,
          enable_tab_bar = false,
        }
      '';
    };
  };
}
