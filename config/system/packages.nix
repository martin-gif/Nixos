{ pkgs, config, inputs, ... }:

let
  my-python-packages = ps: with ps; [
    pandas
    requests
  ];
in {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget 
    curl 
    git 
    neofetch
    libnotify
    polkit_gnome
    jetbrains.pycharm-community-bin
    waybar
    (pkgs.python3.withPackages my-python-packages)
    unzip
 ];

  # programs.steam.gamescopeSession.enable = true;
  # programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
  
 # programs.mtr.enable = true;
 # programs.gnupg.agent = {
 #   enable = true;
 #   enableSSHSupport = true;
 # };
 #
 # virtualisation.libvirtd.enable = true;
 # programs.virt-manager.enable = true;
}
