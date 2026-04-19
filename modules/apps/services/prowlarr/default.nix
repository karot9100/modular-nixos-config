{ config, pkgs, lib, ... }:

{

  options.mymodules.prowlarr.enable = lib.mkEnableOption "prowlarr";

  config = lib.mkIf config.mymodules.prowlarr.enable {

    services.prowlarr = {
      enable = true;
      openFirewall = true;
    };

  };

}

