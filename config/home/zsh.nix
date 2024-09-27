{ pkgs, config, ... }:

{
    programs.zsh = {
        package = pkgs.zsh;
        enable = true;
        shellAliases = {
            ll = "ls -l";
            update = "sudo nixos-rebuild switch";
            lg = "lazygit";
            nixconfig = "cd /etc/nixos/ && sudo -E nvim";
        };
        oh-my-zsh = {
            enable = true;
            plugins = ["git"];
        };
        plugins = [
            {
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
        ];
        initExtra = ''
            source ~/.p10k.zsh
        '';
    # histSize = 10000;
    # histFile = "${config.xdg.dataHome}/zsh/history";
    };
}
