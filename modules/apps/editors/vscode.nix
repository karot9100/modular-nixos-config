{ config, pkgs, lib, ... }:

{

  options.mymodules.vscode.enable = lib.mkEnableOption "vscode";

  config = lib.mkIf config.mymodules.vscode.enable {

    environment.systemPackages = with pkgs; [
      vscode
    ];

  };

}
