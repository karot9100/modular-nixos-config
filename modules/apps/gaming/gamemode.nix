{ config, pkgs, lib, ... }:

{

  programs.gamemode.enable = true;
  
  environment.systemPackages = with pkgs; [
    gamemode
    gamescope
    mangohud
  ];

}
