{ config, pkgs, lib, ... }:

{
  imports = [
    ../profiles/server.nix
  ];

  # Hostname
  networking.hostName = "nixos-server";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # SSH — enabled on the server
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
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
