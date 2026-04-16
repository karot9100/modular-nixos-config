{ config, pkgs, lib, ... }:

{

  options.mymodules.radarr.enable = lib.mkEnableOption "radarr";

  config = lib.mkIf config.mymodules.radarr.enable {

    environment.systemPackages = with pkgs; [
      radarr
    ];

  };

}

