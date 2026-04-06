{ config, pkgs, ... }:

{

  # Pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  security.rtkit.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.upower.enable = true;

  # GUI mixers / bluetooth managers
  environment.systemPackages = with pkgs; [
    pwvucontrol
    overskride
  ];

}

