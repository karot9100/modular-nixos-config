{ config, pkgs, lib, ... }:


{

  options.mymodules.virt-manager.enable = lib.mkEnableOption "virt-manager";

  config = lib.mkIf config.mymodules.virt-manager.enable {

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
  ];

  virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;  # TPM support
      };
    };

    # Auto-start default NAT network on boot
    systemd.services.libvirtd.postStart = ''
      sleep 1
      ${pkgs.libvirt}/bin/virsh net-autostart default
      ${pkgs.libvirt}/bin/virsh net-start default || true
    '';
  };
}

