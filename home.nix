{ config, pkgs, inputs, username,
  gitUsername, gitEmail, gtkThemeFromScheme,
  theme, browser, wallpaperDir, wallpaperGit,
  flakeDir, waybarStyle, ... }:

{
  # Home Manager Settings
  home.username = "marvin";
  home.homeDirectory = "/home/marvin";
  home.stateVersion = "23.11";
  # home.sessionVariables.GTK_THEME = "Tokyonight-Dark-B";


  # Import Program Configurations
  imports = [
#    inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    ./config/home
  ];

  # Define Settings For Xresources
  xresources.properties = {
    "Xcursor.size" = 24;
  };

  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "martin-git";
    userEmail = "marvin.raschke02@gmail.com";
  };

  
  gtk = {
    enable = true;
    theme = {
      name = "Yaru-dark";
      package = pkgs.yaru-theme;
    };
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
        enable = true;
        createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  programs.home-manager.enable = true;
}
