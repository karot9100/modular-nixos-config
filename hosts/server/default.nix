{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/server.nix
    ../../users/simon.nix
  ];

  # Static networking — servers don't use NetworkManager.
  networking = {
    hostName = "nixos-server";
    useDHCP  = false;

    interfaces.enp2s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address      = "192.168.0.44";
        prefixLength = 24;
      }];
    };

    defaultGateway = "192.168.0.1";
    nameservers    = [ "195.130.130.130" "195.130.130.4" ];
  };

  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages;

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "25.11";
}
