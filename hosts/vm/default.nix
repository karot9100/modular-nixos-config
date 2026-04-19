# hosts/vm/default.nix
{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/server.nix   # VMs are headless like servers
    ../../users/simon.nix
  ];

  networking.hostName = "nixos-vm";

  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_lts;

  # GRUB for BIOS/QEMU VMs — swap to systemd-boot for UEFI VMs.
  boot.loader.grub = {
    enable      = true;
    device      = "/dev/vda";
    useOSProber = false;
  };

  system.stateVersion = "25.11";
}
