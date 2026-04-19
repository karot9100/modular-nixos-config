{ config, pkgs, lib, ... }:

{

  options.mymodules.jellyfin.enable = lib.mkEnableOption "jellyfin";

  config = lib.mkIf config.mymodules.jellyfin.enable {

    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };

  };

}

