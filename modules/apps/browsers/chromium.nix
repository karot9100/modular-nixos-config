{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    chromium
  ];

  systemd.tmpfiles.rules = [
    "d /home/simon/.config 0755 simon users - -"
    "d /home/simon/.config/chromium 0755 simon users - -"
  ];

}

