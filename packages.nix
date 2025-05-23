{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # productivity
    vim
    wget
    htop
    liquidctl
    git
    statix
    nix-tree
    nix-template
    alejandra # Nix formatter
    notepadqq
    brave
    wezterm
    vscode
    direnv

    # Compressing and decrompressing files
    p7zip
    zip
    unzip
    unrar

    # Converting image formats to different formats
    imagemagick

    # Flameshot & Dependencies (for screenshot tool)
    flameshot
    gnome-themes-extra # Provides Adwaita theme
    gtk_engines

    # VMs
    virt-manager
    qemu
    libvirt
    virt-viewer

    # LaTex support
    texlive.combined.scheme-full
    tectonic  # modern CLI builder (faster, minimal)

    # VPN
    openvpn
    networkmanager-openvpn
    openresolv

    # entertainment
    discord
    spotify

    # Add Haskell Language Server (system-wide for fallback)
    haskell-language-server
  ];
}
