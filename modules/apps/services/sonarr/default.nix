{ config, pkgs, lib, ... }:

{

  options.mymodules.sonarr.enable = lib.mkEnableOption "sonarr";

  config = lib.mkIf config.mymodules.sonarr.enable {

    services.sonarr = {
      enable = true;
      openFirewall = true;
    };

  };

}

