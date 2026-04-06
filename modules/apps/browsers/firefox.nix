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

  system.activationScripts.firefoxProfile = ''
    mkdir -p /home/simon/.mozilla/firefox
  '';

}
