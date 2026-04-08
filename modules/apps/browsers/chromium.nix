{ config, pkgs, lib, ... }:

{

  programs.chromium = {
    enable = true;
    extraOpts = {
      "ForceDarkModeEnabled" = true;
    };
  };

}

