{ lib, ... }:

{

  imports = [ ./common.nix ];

  # Servers configure networking statically in the host file.
  mymodules.networking.enable = lib.mkForce false;

  # SSH (hardened) — enabled for every host using this profile.
  services.openssh = {
    enable   = true;
    settings = {
      PermitRootLogin              = "no";
      PasswordAuthentication       = false;
      KbdInteractiveAuthentication = false;
    };
  };

  networking.firewall.enable          = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Services
  mymodules.docker.enable             = true;
  mymodules.radarr.enable             = true;
  mymodules.sonarr.enable             = true;
  mymodules.prowlarr.enable           = true;
  mymodules.bazarr.enable             = true;
  mymodules.jellyfin.enable           = true;

}
