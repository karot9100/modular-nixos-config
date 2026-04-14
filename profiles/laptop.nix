{ config, pkgs, lib, ... }:

{

  imports = [
    ../modules/all-modules.nix
  ];

  # Browsers
  mymodules.chromium.enable         = true;
  mymodules.firefox.enable          = true;

  # Cli tools
  mymodules.yt-dlp.enable           = true;

  # Dev
  mymodules.virt-manager.enable     = false;
  mymodules.docker.enable           = false;
  mymodules.java.enable             = false;
  mymodules.claude.enable           = true;

  # Editors
  mymodules.gimp.enable             = false;
  mymodules.vim.enable              = true;
  mymodules.vscode.enable           = false;

  # File Browsers
  mymodules.files.enable            = true;

  # Gaming
  mymodules.gamemode.enable         = true;
  mymodules.perm-pkgs.enable        = true;
  mymodules.steam.enable            = true;
  mymodules.wine.enable             = true;

  # Media
  mymodules.media.enable            = true;
  mymodules.music.enable            = true;
  mymodules.screenshot.enable       = true;
  mymodules.video.enable            = true;

  # Office
  mymodules.libreoffice.enable      = false;

  # Terminals
  mymodules.alacritty.enable        = true;

  # Desktops
  mymodules.hyprland.enable         = true;

  # Hardware
  mymodules.input.enable            = true;
  mymodules.nvidia.enable           = true;
  mymodules.nvidia.batterySaver     = true;
  mymodules.power-management.enable = true;
  mymodules.lenovo-legion.enable    = true;
  mymodules.printing.enable         = true;
  mymodules.sensors.enable          = true;
  mymodules.sound.enable            = true;
  mymodules.storage.enable          = true;

  # System
  mymodules.base.enable             = true;
  mymodules.bash.enable             = true;
  mymodules.dotfiles.enable         = true;
  mymodules.keyring.enable          = true;
  mymodules.networking.enable       = true;
  mymodules.theme.enable            = true;
  mymodules.users.enable            = true;





}
