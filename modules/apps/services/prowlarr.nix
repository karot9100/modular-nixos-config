{ config, pkgs, lib, ... }:

{

  options.mymodules.prowlarr.enable = lib.mkEnableOption "prowlarr";

  config = lib.mkIf config.mymodules.prowlarr.enable {

    environment.systemPackages = with pkgs; [
      prowlarr
    ];

  };

}

