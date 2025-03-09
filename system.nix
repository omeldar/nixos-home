{
  config,
  pkgs,
  ...
}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Keep only the last 10 NixOS generations
  boot.loader.systemd-boot.configurationLimit = 10;

  # Automatically clean up old generations
  nix.settings.auto-optimise-store = true;
  
  boot.kernelModules = [ "acpi_cpufreq" ];
  powerManagement.cpuFreqGovernor = "performance";

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  security.sudo.extraConfig = ''
    Defaults env_reset,pwfeedback
  '';

  security.sudo.extraRules = [
    {
      users = ["akotami"]; # Your username
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}
