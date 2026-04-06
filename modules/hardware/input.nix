{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    libinput
    piper
  ];

  services.ratbagd.enable = true;

}
