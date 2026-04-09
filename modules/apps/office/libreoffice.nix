{ config, pkgs, lib, ... }:

{

  options.mymodules.libreoffice.enable = lib.mkEnableOption "libreoffice";

  config = lib.mkIf config.mymodules.libreoffice.enable {

    environment.systemPackages = with pkgs; [
      libreoffice-qt
    ];

  };

}
