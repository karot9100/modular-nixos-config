{ config, pkgs, lib, ... }:

{

  options.mymodules.java.enable = lib.mkEnableOption "java";

  config = lib.mkIf config.mymodules.java.enable {
    
    environment.systemPackages = with pkgs; [
      jdk
    ];
  };

}
