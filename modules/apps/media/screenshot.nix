{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    grim
    slurp
  ];

}
