{ config, pkgs, lib, ... }:

{

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

}
