{ config, pkgs, lib, ... }:

{

  options.mymodules.media.enable = lib.mkEnableOption "media";

  config = lib.mkIf config.mymodules.media.enable {

    environment.systemPackages = with pkgs; [
      playerctl
    ];

  };

}
