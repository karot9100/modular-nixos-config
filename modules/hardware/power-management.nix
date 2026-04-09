{ config, pkgs, lib, ... }:

{

  options.mymodules.power-management.enable = lib.mkEnableOption "power-management";

  config = lib.mkIf config.mymodules.power-management.enable {

    # Disable PPD — conflicts with TLP
    services.power-profiles-daemon.enable = false;

    services.tlp = {
      enable = true;
      settings = {
        # CPU on battery: powersave governor, no turbo, balance EPP
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        # CPU on AC: full performance
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_AC = 1;

        # WiFi power saving
        WIFI_PWR_ON_BAT = "on";
        WIFI_PWR_ON_AC = "off";

        # PCIe/NVMe power saving on battery
        PCIE_ASPM_ON_BAT = "powersupersave";

        # USB autosuspend (keeps mice/keyboards working fine)
        USB_AUTOSUSPEND = 1;
      };
    };

    security.sudo.extraRules = [
      {
        users = [ "simon" ];
        commands = [
          {
            command = "/run/current-system/sw/bin/tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];

  };

}

