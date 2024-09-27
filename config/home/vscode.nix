{ pkgs, config, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
            jnoortheen.nix-ide
            valentjn.vscode-ltex
      ];
      userSettings = {
         "editor.fontFamily" = "JetBrainsMono Nerd Font Italic";
      };
    };
}
