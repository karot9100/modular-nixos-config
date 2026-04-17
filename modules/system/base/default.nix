{ config, pkgs, lib, ... }:

{

  options.mymodules.base.enable = lib.mkEnableOption "base";

  config = lib.mkIf config.mymodules.base.enable {

    environment.systemPackages = with pkgs; [
      bat
      tree
      pciutils 
      btop 
      unzip 
      fastfetch 
      git 
      p7zip 
      wget
      killall 
    ];

    # Enable Appimage support
    programs.appimage.enable = true;

    # Enable terminal info
    environment.enableAllTerminfo = true;

    # Set your time zone.
    time.timeZone = "Europe/Brussels";

    # Select internationalisation properties.
    i18n.defaultLocale = "nl_BE.UTF-8";
    
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "be";
      variant = "";
    };
    
    # Configure console keymap
    console.keyMap = "be-latin1";

  };

}
