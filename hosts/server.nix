{ config, pkgs, lib, ... }:

{
  imports = [
    ../profiles/server.nix
  ];

  networking = {
    hostName = "nixos-server";
    useDHCP = false;

    interfaces.enp2s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.0.44";
        prefixLength = 24;
      }];
    };

    defaultGateway = "192.168.0.1";
    nameservers = [ "195.130.130.130" "195.130.130.4" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # SSH — enabled on the server
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # Open SSH port
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Bootloader — adjust if not EFI (e.g. use grub like vm.nix)
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "25.11";
}
