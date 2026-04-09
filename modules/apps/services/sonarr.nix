{ config, pkgs, lib, ... }:

{

  options.mymodules.sonarr.enable = lib.mkEnableOption "sonarr";

  config = lib.mkIf config.mymodules.sonarr.enable {

    environment.systemPackages = with pkgs; [
      sonarr
    ];

  };

}

