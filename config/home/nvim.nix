{ pkgs, config, ... }:


let
    nvim-spell-de-utf8-dictionary = builtins.fetchurl {
        url = "http://ftp.vim.org/vim/runtime/spell/de.utf-8.spl";
        sha256 = "1ld3hgv1kpdrl4fjc1wwxgk4v74k8lmbkpi1x7dnr19rldz11ivk";
    };
in 
{
    programs.neovim = {
        enable = true;
    };
    home.file."${config.xdg.configHome}/nvim/spell/de.utf-8.spl".source = nvim-spell-de-utf8-dictionary;
}