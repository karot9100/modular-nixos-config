{ config, pkgs, lib, ... }:

{

  options.mymodules.storage.enable = lib.mkEnableOption "storage";

  config = lib.mkIf config.mymodules.storage.enable {

    environment.systemPackages = with pkgs; [
      gnome-disk-utility
      gnome-multi-writer
      parted
    ];

  };

}
