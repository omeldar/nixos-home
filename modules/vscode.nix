{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true; # Enable VSCode in Home Manager

    # Install Extensions
    extensions = with pkgs.vscode-extensions; [
      haskell.haskell
      justusadam.language-haskell
      esbenp.prettier-vscode   # Prettier for formatting
      eamodio.gitlens          # GitLens for Git history
      sdras.night-owl          # Night Owl Theme
    ];

    # Set VSCode User Settings
    userSettings = {
      "editor.fontSize" = 12;
      "editor.fontFamily" = "Fira Code, JetBrains Mono, Consolas, 'Courier New', monospace";
      "editor.tabSize" = 4;
      "editor.wordWrap" = "on";
      "workbench.colorTheme" = "Night Owl";
      "editor.formatOnSave" = true;
      "files.autoSave" = "afterDelay";
      "editor.minimap.enabled" = true;
      "terminal.integrated.fontSize" = 10;

      # Prefer Project's HLS, but use system fallback
      "haskell.serverExecutablePath" = "\${workspaceFolder}/.nix-profile/bin/haskell-language-server";
      "haskell.serverExecutablePathFallback" = "${pkgs.haskell-language-server}/bin/haskell-language-server";
    };
  };
}
