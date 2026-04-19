# users/simon.nix
# Simon's system account. Imported by every host.
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
    # openssh.authorizedKeys.keys = [
    #   "ssh-ed25519 AAAA... simon@laptop"
    # ];
  };

  users.groups.video  = {};
  users.groups.render = {};

  security.sudo.wheelNeedsPassword = true;
}
