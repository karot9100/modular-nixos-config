{ config, pkgs, lib, ... }:

{

  options.mymodules.yt-dlp.enable = lib.mkEnableOption "yt-dlp";

  config = lib.mkIf config.mymodules.yt-dlp.enable {

    environment.systemPackages = with pkgs; [
      yt-dlp
    ];

  };

}
