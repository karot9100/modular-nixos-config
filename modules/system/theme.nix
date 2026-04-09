{ config, pkgs, lib, ... }:

{

  options.mymodules.theme.enable = lib.mkEnableOption "theme";

  config = lib.mkIf config.mymodules.theme.enable {

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

      # dependencies to apply themes to some stuff
      glib
      gsettings-desktop-schemas
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

    programs.dconf.enable = true;

      # Write GTK settings files declaratively
      system.activationScripts.gtkTheme = ''
        mkdir -p /home/simon/.config/gtk-3.0
        mkdir -p /home/simon/.config/gtk-4.0

        cat > /home/simon/.config/gtk-3.0/settings.ini << EOF
  [Settings]
  gtk-theme-name=Tokyonight-Dark
  gtk-icon-theme-name=Papirus-Dark
  gtk-cursor-theme-name=Bibata-Modern-Ice
  gtk-cursor-theme-size=24
  gtk-application-prefer-dark-theme=1
  EOF

        cat > /home/simon/.config/gtk-4.0/settings.ini << EOF
  [Settings]
  gtk-theme-name=Tokyonight-Dark
  gtk-icon-theme-name=Papirus-Dark
  gtk-cursor-theme-name=Bibata-Modern-Ice
  gtk-cursor-theme-size=24
  gtk-application-prefer-dark-theme=1
  EOF

        chown -R simon:users /home/simon/.config/gtk-3.0
        chown -R simon:users /home/simon/.config/gtk-4.0
      '';

    systemd.user.services.apply-gtk-theme = {
      description = "Apply GTK/dconf theme settings";
      wantedBy = [ "default.target" ];
      after = [ "dconf.service" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = let
          script = pkgs.writeShellScript "apply-gtk-theme" ''
            ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark'
            ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
            ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
            ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
            ${pkgs.glib}/bin/gsettings set org.gnome.desktop.interface cursor-size 24
          '';
        in "${script}";
      };
      environment = {
        DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
        GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      };
    };  

  };

}
