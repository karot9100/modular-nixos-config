{ config, pkgs, lib, ... }:

{

  imports = [

    ../profiles/vm.nix

  ];

  # Define Hostname
  networking.hostName = "nixos-vm";

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

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

}
