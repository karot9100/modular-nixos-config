{ config, pkgs, lib, ... }:

{

  options.mymodules.bazarr.enable = lib.mkEnableOption "bazarr";

  config = lib.mkIf config.mymodules.bazarr.enable {

    services.bazarr = {
      enable = true;
      openFirewall = true;
    };

  };

}

