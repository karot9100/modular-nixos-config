{ config, pkgs, lib, ... }:

{

  options.mymodules.gimp.enable = lib.mkEnableOption "gimp";

  config = lib.mkIf config.mymodules.gimp.enable {

    environment.systemPackages = with pkgs; [
      gimp
    ];

  };

}
