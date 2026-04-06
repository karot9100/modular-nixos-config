{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    gnome-disk-utility
    gnome-multi-writer
    parted
  ];

}
