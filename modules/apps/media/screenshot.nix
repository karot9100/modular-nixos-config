{ config, pkgs, lib, ... }:

{

  options.mymodules.screenshot.enable = lib.mkEnableOption "screenshot";

  config = lib.mkIf config.mymodules.screenshot.enable {

    environment.systemPackages = with pkgs; [
      grim
      slurp
    ];

    systemd.user.tmpfiles.rules = [
      "d /home/simon/Screenshots 0755 simon users -"
    ];

  };

}
