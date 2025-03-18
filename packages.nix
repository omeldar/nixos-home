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
    p7zip
    zip
    unzip

    # Flameshot & Dependencies (for screenshot tool)
    flameshot
    gnome-themes-extra # Provides Adwaita theme
    gtk_engines

    # VMs
    virt-manager
    qemu
    libvirt
    virt-viewer

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
