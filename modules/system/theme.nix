{ config, pkgs, lib, ... }:

{

  # Theming packages
  environment.systemPackages = with pkgs; [

    # Fonts
    font-awesome_4
    font-awesome
    lato
    nerd-fonts.jetbrains-mono

    # GTK Themes
    tokyonight-gtk-theme
    #gnome-themes-extra
    #whitesur-gtk-theme
    #adapta-gtk-theme

    # Cursors
    bibata-cursors

    # Icons
    #adwaita-icon-theme
    #whitesur-icon-theme
    papirus-icon-theme

  ];
  
  # All nerd fonts
  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);


  environment.variables = {
    TERMINAL              = "alacritty";
    GTK_THEME             = "Tokyonight-Dark";
    XCURSOR_SIZE          = "24";
    XCURSOR_THEME         = "Bibata-Modern-Ice";
    XDG_ICON_THEME        = "Papirus-Dark";
    QT_QPA_PLATFORMTHEME  = "gtk2";
    MOZ_ENABLE_WAYLAND    = "1";
    MOZ_ALLOW_GTK_DARK_THEME = "1";
    GTK_TITLEBAR_DECORATION = "client";
    STEAM_USE_SYSTEM_GTK  = "1";
  };
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP   = "Hyprland";
    XCURSOR_THEME         = "Bibata-Modern-Ice";
    XCURSOR_SIZE          = "24";
  };
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "adwaita-dark";
  };

}
