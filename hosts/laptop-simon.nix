{ config, pkgs, lib, ... }:

{

  imports = [

    ../profiles/laptop.nix

  ];

  # Define Hostname
  networking.hostName = "Simon-Laptop-Nixos";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Define kernel version
  boot.kernelPackages = pkgs.linuxPackages;
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_lts;

  # Enable SSH
  services.openssh.enable = true;

  # Installed StateVersion
  system.stateVersion = "25.11";

  # Bootloader. (check for new install)
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "nodev";
  #boot.loader.grub.efiSupport = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  # Test bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
}
