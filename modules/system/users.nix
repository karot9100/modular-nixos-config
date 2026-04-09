{ config, pkgs, lib, ... }:

{

  options.mymodules.users.enable = lib.mkEnableOption "users";

  config = lib.mkIf config.mymodules.users.enable {

    # Define a user account
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

    users.groups.video = {};
    users.groups.render = {};

  };

}
