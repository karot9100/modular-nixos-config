{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/LOQ.nix
    ../../users/simon.nix
  ];

  networking.hostName = "Simon-Laptop-Nixos";

  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_lts;

  # Hardware specific to THIS machine — not in the profile, so other
  # laptops don't inherit Lenovo Legion / NVIDIA config.
  mymodules.nvidia.enable        = true;
  mymodules.nvidia.batterySaver  = true;
  mymodules.lenovo-legion.enable = true;

  boot.loader = {
    systemd-boot.enable             = true;
    systemd-boot.configurationLimit = 1;
    efi.canTouchEfiVariables        = true;
  };

  fileSystems."/mnt/1tb-ssd" = {
    device  = "/dev/disk/by-uuid/489df8ee-3bd1-4f41-80af-d0245509aac4";
    fsType  = "ext4";
    options = [ "defaults" "nofail" ];
  };

  system.stateVersion = "25.11";
}
