{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    grim
    slurp
  ];

  systemd.user.tmpfiles.rules = [
    "d /home/youruser/Screenshots 0755 youruser users -"
  ];

}
