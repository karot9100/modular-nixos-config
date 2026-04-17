{ config, pkgs, lib, ... }:

{

  options.mymodules.appimage.enable = lib.mkEnableOption "appimage";

  config = lib.mkIf config.mymodules.appimage.enable {

    programs.appimage.enable = true;

  };

}
