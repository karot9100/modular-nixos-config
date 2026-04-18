{ config, pkgs, lib, ... }:

{

  options.mymodules.users.enable = lib.mkEnableOption "users";

  config = lib.mkIf config.mymodules.users.enable {

    users.users.simon = {
      isNormalUser = true;
      description = "Simon Vuylsteke";
      extraGroups = [ 
        "networkmanager" 
        "wheel"
        "video"
        "render"
        "lpadmin"
        "docker"
        "libvirt"
      ];
      packages = with pkgs; [];
    };

    users.users.jelka = {
      isNormalUser = true;
      description = "Jelka Labeeuw";
      extraGroups = [ 
        "networkmanager" 
        "video"
        "lpadmin"
      ];
      packages = with pkgs; [];
    };

    users.users.serveruser = {
      isNormalUser = true;
      description = "Drizella";
      extraGroups = [ 
        "video"
        "render"
        "docker"
      ];
      packages = with pkgs; [];
    };

    users.groups.video = {};
    users.groups.render = {};

  };

}
