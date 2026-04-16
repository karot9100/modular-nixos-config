{ config, pkgs, lib, ... }:

{

  options.mymodules.power-management.enable = lib.mkEnableOption "power-management";

  config = lib.mkIf config.mymodules.power-management.enable {

#     # RAPL power limit script
#     systemd.services.rapl-battery = {
#       description = "Set RAPL power limits on battery";
#       wantedBy = [ "multi-user.target" ];
#       after = [ "tlp.service" ];
#       serviceConfig = {
#         Type = "oneshot";
#         RemainAfterExit = true;
#         ExecStart = pkgs.writeShellScript "rapl-set" ''
#           if [ "$(cat /sys/class/power_supply/ACAD/online)" = "0" ]; then
#             echo 25000000 > /sys/devices/virtual/powercap/intel-rapl/intel-rapl:0/constraint_0_power_limit_uw
#             echo 35000000 > /sys/devices/virtual/powercap/intel-rapl/intel-rapl:0/constraint_1_power_limit_uw
#           fi
#         '';
#       };
#     };

    # Also trigger on AC unplug via udev
    services.udev.extraRules = ''
      SUBSYSTEM=="power_supply", ATTR{online}=="0", ENV{POWER_SUPPLY_NAME}=="ACAD", RUN+="${pkgs.systemd}/bin/systemctl restart rapl-battery.service"
    '';

    boot.kernel.sysctl = {
      "vm.dirty_writeback_centisecs" = 1500;
    };
    # Disable PPD — conflicts with TLP
    services.power-profiles-daemon.enable = false;

    services.tlp = {
      enable = true;
      settings = {
        # CPU on battery: powersave governor, no turbo, balance EPP
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        
        # Battery Saver TEST!!
        CPU_MAX_PERF_ON_BAT = 50;
        PLATFORM_PROFILE_ON_BAT = "balanced";
        PLATFORM_PROFILE_ON_AC = "performance";
        RUNTIME_PM_ON_BAT = "auto";
        RUNTIME_PM_ON_AC = "on";
        DISK_IOSCHEDULER_ON_BAT = "mq-deadline";
        SATA_LINKPWR_ON_BAT = "med_power_with_dipm";
        # CPU on AC: full performance
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_AC = 1;

        # WiFi power saving
        WIFI_PWR_ON_BAT = "on";
        WIFI_PWR_ON_AC = "off";

        # PCIe/NVMe power saving on battery
#        PCIE_ASPM_ON_BAT = "powersupersave";

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

