{ lib, ... }:

{
  imports = [ ./common.nix ];

  # Servers configure networking statically in the host file.
  mymodules.networking.enable = lib.mkForce false;

  # Core services for a server.
  mymodules.docker.enable = true;

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
}
