{ pkgs, config, ... }:

{
  imports = [
    # Enable &/ Configure Programs
    ./hyprland.nix
    ./waybar.nix
    ./kitty.nix
    ./zsh.nix
    ./firefox.nix
    ./nvim.nix
    ./vscode.nix

    # Install Programs & Scripts For User
    ./packages.nix

  ];
}
