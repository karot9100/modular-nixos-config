{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    libreoffice-qt
  ];

}
