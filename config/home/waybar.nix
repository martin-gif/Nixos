{ pkgs, config, lib, waybarStyle, ... }:

{
    # Configure & Theme Waybar
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
    };
  }
