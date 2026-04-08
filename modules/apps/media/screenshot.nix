{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    grim
    slurp
  ];

  systemd.user.tmpfiles.rules = [
    "d /home/simon/Screenshots 0755 youruser users -"
  ];

}
