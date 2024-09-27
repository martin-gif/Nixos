let
  pkgs = import <nixpkgs> { };
in
{

  zathuraTheme = pkgs.callPackage ./zathuraTheme.nix { };

}
