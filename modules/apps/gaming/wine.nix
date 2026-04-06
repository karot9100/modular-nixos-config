{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wine
    wineWowPackages.stable
    winetricks
#    bottles
  ];

}

