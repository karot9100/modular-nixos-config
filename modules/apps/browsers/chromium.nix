{ config, pkgs, lib, ... }:

{

  options.mymodules.chromium.enable = lib.mkEnableOption "chromium";

  config = lib.mkIf config.mymodules.chromium.enable {

    environment.systemPackages = with pkgs; [
      chromium
    ];

    systemd.tmpfiles.rules = [
      "d /home/simon/.config 0755 simon users - -"
      "d /home/simon/.config/chromium 0755 simon users - -"
    ];

  };

}

