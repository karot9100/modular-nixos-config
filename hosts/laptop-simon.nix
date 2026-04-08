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
  services.openssh.enable = false;

  # Installed StateVersion
  system.stateVersion = "25.11";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Mounted SSD
  fileSystems."/mnt/1tb-ssd" = {
    device = "/dev/disk/by-uuid/489df8ee-3bd1-4f41-80af-d0245509aac4";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };

}
