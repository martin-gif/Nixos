{ pkgs, config, stdenv, fetchFromGitHub, ... }:
let 
    flavour = "macchiato";
    
    catppuccin-zathura = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "zathura";
        rev = "main";
        sha256 = "5Vh2bVabuBluVCJm9vfdnjnk32CtsK7wGIWM5+XnacM=";
    };
in{
    programs.zathura = {
        package = pkgs.zathura;
        enable = true;
        extraConfig = ''
        include themes/catppuccin-${flavour}
        set recolor true
        set recolor-keephue true
        '';
    };
    xdg.configFile."zathura/themes".source = "${catppuccin-zathura}/src/";
}


