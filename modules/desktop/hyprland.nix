{ config, pkgs, lib, ... }:

{

  # Compositor
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Display manager
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = "simon";
  };

  # Suppress redundant getty on tty1 when using autoLogin
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # SwayOSD — on-screen display for volume/brightness keys
  systemd.services.swayosd-libinput-backend = {
    description = "SwayOSD LibInput backend for listening to certain keys";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.swayosd}/bin/swayosd-libinput-backend";
      Restart = "always";
    };
  };

  # XDG portal (screen share, file picker)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Packages
  environment.systemPackages = with pkgs; [

    # Hyprland ecosystem
    hyprpaper
    hyprlock
    hypridle
    hyprpolkitagent
    #xdg-desktop-portal-hyprland # should be installed trough hyprland enable true

    # Bar / launcher / OSD
    waybar
    swayosd
    fuzzel
  ];

}

