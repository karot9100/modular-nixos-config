{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    chromium
  ];

  programs.chromium = {
    enable = true;
    extraOpts = {
      "ForceDarkModeEnabled" = true;
    };
  };

}

