{ config, pkgs, lib, ... }:

{

  programs.firefox = {
    enable = true;
    preferences = {
      "browser.startup.homepage"                        = "http://misternoons.com";
      "privacy.resistFingerprinting"                    = true;
      "ui.systemUsesDarkTheme"                          = "1";
      "layout.css.prefers-color-scheme.content-override" = "2";
    };
    policies = {
      DisableTelemetry = true;
    };
  };

  # Creating the folder and set permissions if not already existing
  systemd.tmpfiles.rules = [
    "d /home/simon/.mozilla/firefox 0755 simon users - -"
  ];

}
