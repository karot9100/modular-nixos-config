{ config, pkgs, lib, ... }:

{

  options.mymodules.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf config.mymodules.firefox.enable {

    programs.firefox = {
      enable = true;
      preferences = {
        "privacy.resistFingerprinting"                    = true;
        "ui.systemUsesDarkTheme"                          = "1";
        "layout.css.prefers-color-scheme.content-override" = "2";
      };
      policies = {
        DisableTelemetry = true;
        Homepage = {
          URL            = "http://misternoons.com";
          Locked         = true;   # prevents Firefox from overriding it
          StartPage      = "homepage";  # ensures it opens on new window, not previous session
        };
      };
    };

    # Creating the folder and set permissions if not already existing
    systemd.tmpfiles.rules = [
      "v /home/simon/.mozilla 0755 simon users - -"
      "v /home/simon/.mozilla/firefox 0755 simon users - -"
    ];
  };

}
