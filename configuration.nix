{ inputs, config, lib, pkgs, username, hostname, ... }:

let 
  inherit (./options.nix)
    theLocale theTimezone wallpaperDir
    theLCVariables theKBDLayout
    theShell flakeDir;

in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./config/system
    ];

  
  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;  

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  console = {
     font = "Lat2-Terminus16";
     keyMap = "de";
   };

  services = {
    xserver = {
      layout = "de";
    };
  };

  # Define user account
  users = {
    mutableUsers = true;
    users."${username}" = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };
  };
  programs."zsh".enable = true;

  environment.variables = {
    # FLAKE = "${flakeDir}";
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Do better not change
  system.stateVersion = "23.11"; # Did you read the comment?

}

# error: cached failure of attribute 'nixosConfigurations.nixos.config.system.build.toplevel'
# sudo nixos-rebuild switch --flake . --option eval-cache false
