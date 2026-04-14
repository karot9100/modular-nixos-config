{ config, pkgs, lib, ... }:

{

  options.mymodules.claude.enable = lib.mkEnableOption "claude";

  config = lib.mkIf config.mymodules.claude.enable {
    
    environment.systemPackages = with pkgs; [
     claude-code 
    ];
  };

}

