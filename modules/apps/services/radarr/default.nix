{ config, pkgs, lib, ... }:

{

  options.mymodules.radarr.enable = lib.mkEnableOption "radarr";

  config = lib.mkIf config.mymodules.radarr.enable {

    services.radarr = {
      enable = true;
      openFirewall = true;
    };

  };

}

