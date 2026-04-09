{ config, pkgs, lib, ... }:

{

  options.mymodules.files.enable = lib.mkEnableOption "files";

  config = lib.mkIf config.mymodules.files.enable {

    environment.systemPackages = with pkgs; [
      gvfs
      cifs-utils
      nautilus
      nautilus-open-any-terminal
      xfce.exo
      loupe
    ];

    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-media-tags-plugin
        thunar-volman
      ];
    };

    services.gvfs.enable = true;
    services.dbus.enable = true;

  };

}

