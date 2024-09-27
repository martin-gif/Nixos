{ pkgs, config, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    spotify
    waybar
    pywal
    swaynotificationcenter
    zotero
    swww
    thunderbird-unwrapped
    keepassxc
    obsidian
    rofi
    # neovim
    # zathura
    sioyek
    # gnome.nautilus
    # libsForQt5.dolphin
    # xfce.thunar
    xdg-utils
    openconnect
    zoom-us
    wezterm
    lazygit
    anki
    texliveFull
    tomato-c
    grim
    slurp
    wl-clipboard
    pipenv
    sqlitebrowser
    jdk21
    ollama
    discord
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
