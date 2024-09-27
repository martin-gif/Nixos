{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
    name = "zathura Catppuccin theme";

    src = fetchFromGitHub{
        owner = "catppuccin";
        repo = "zathura";
        rev = "main";
        sha256 = "5Vh2bVabuBluVCJm9vfdnjnk32CtsK7wGIWM5+XnacM=";
    };
    dontUnpack = false;
    dontBuild = true;
    installPhase = ''
        mkdir -p $out/zathura/
        cp  zathura $out/zathura/
    '';
}