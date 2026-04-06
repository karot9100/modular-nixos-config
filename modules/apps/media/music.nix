{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    rmpc
    supersonic
  ];

}
