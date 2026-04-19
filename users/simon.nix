{ ... }:

{
  users.users.simon = {
    isNormalUser = true;
    description  = "Simon Vuylsteke";
    extraGroups  = [
      "wheel"
      "networkmanager"
      "video"
      "render"
      "lpadmin"
      "docker"
      "libvirt"
    ];
  };

  users.groups.video  = {};
  users.groups.render = {};

  security.sudo.wheelNeedsPassword = true;
}
