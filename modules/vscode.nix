{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true; # Enable VSCode in Home Manager

    # Install Extensions
    extensions = with pkgs.vscode-extensions; [
      haskell.haskell
      justusadam.language-haskell
      esbenp.prettier-vscode # Prettier for formatting
      eamodio.gitlens # GitLens for Git history
      sdras.night-owl # Night Owl Theme
      bbenoist.nix # Nix language support
      mkhl.direnv
      james-yu.latex-workshop
    ];

    # Set VSCode User Settings
    userSettings = {
      "latex-workshop.message.error.show" = false;
      "latex-workshop.message.warning.show" = false;
      "latex-workshop.message.information.show" = false;

      # Formatting control
      "latex-workshop.latexindent.enabled" = true;
      "latex-workshop.latex.formatter" = "latexindent";
      "latex-workshop.latexindent.path" = "latexindent";
      "latex-workshop.latexindent.args" = [ "-l" ];

      "[latex]" = {
        "editor.defaultFormatter" = "James-Yu.latex-workshop";
      };

      "editor.fontSize" = 12;
      "editor.fontFamily" = "Fira Code, JetBrains Mono, Consolas, 'Courier New', monospace";
      "editor.tabSize" = 4;
      "editor.wordWrap" = "on";
      "workbench.colorTheme" = "Night Owl";
      "editor.formatOnSave" = true;
      "files.autoSave" = "afterDelay";
      "editor.minimap.enabled" = true;
      "terminal.integrated.fontSize" = 14;
      "git.autofetch" = true;

      "terminal.integrated.defaultProfile.linux" = "bash";

      "terminal.integrated.profiles.linux" = {
        "bash" = {
          "path" = "/run/current-system/sw/bin/bash";
        };
      };

      "haskell.serverExecutablePath" = "/nix/store/hdijzd8md5nx54q9qy13yf36h9zlr78m-haskell-language-server-2.9.0.0/bin/haskell-language-server";
      "haskell.serverExecutablePathFallback" = "${pkgs.haskell-language-server}/bin/haskell-language-server";
    };
  };
}
