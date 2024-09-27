{ pkgs ? (import <nixpkgs> {}).pkgs }:
let 
  inherit (pkgs.lib) makeLibraryPath;
  my-python = pkgs.python39;
  python-with-my-packages = my-python.withPackages (p: with p; [
    # default
        numpy
        matplotlib
        pandas

        # test
        codecov
        black
  ]);
in
with pkgs;
mkShell {
  buildInputs = [
    python-with-my-packages
    pipenv
    zlib
 ];
  shellHook = ''
    # fixes libstdc++ issues and libgl.so issues
    # LD_LIBRARY_PATH=${stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/
    export LD_LIBRARY_PATH="${stdenv.cc.cc.lib.outPath}:$LD_LIBRARY_PATH"
    # fixes xcb issues :
    QT_PLUGIN_PATH=${qt5.qtbase}/${qt5.qtbase.qtPluginPrefix}
  '';
}
