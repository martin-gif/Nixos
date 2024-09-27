{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./packages.nix
    ./polkit.nix
    ./nvidia.nix
    ./services.nix
    ./displaymanager.nix
    ./theme.nix
  ];
}
