{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    lm_sensors
    powertop
    mesa-demos
  ];

}
