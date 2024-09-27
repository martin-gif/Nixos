{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"]; # maybe move later to Nvidia

    displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "tokyo-night-sddm";
    }; 
  };

  environment.systemPackages = 
  let
    tokyo-night = pkgs.libsForQt5.callPackage ./sddm-theme.nix {};
  in [
    tokyo-night

  ];
}
