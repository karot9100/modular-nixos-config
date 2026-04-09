{ config, pkgs, lib, ... }:

{

  options.mymodules.bash.enable = lib.mkEnableOption "bash";

  config = lib.mkIf config.mymodules.bash.enable {

    programs.bash = {
      enable = true;
      interactiveShellInit = ''
        export TERM=xterm-256color
        eval $(${pkgs.coreutils}/bin/dircolors -b)
      '';
      shellAliases = {
        ls = "ls --color=tty";
        rebuild = "sudo nixos-rebuild switch";
        upgrade = "sudo nixos-rebuild switch --upgrade";
        clean = "sudo nix-collect-garbage -d";
        youtube = "cd ~/Downloads && yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata";
        myconfig = ''find /etc/nixos -name "*.nix" | sort | xargs -I{} sh -c 'echo "=== {} ===" && cat {}' '';
      };
    };

  };

}

