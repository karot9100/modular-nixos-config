{ config, pkgs, lib, ... }:

{

  imports = [

    # Apps
    ../modules/apps/editors/vim.nix
    ../modules/apps/terminals/alacritty.nix
    ../modules/apps/browsers/firefox.nix

    # System
    ../modules/system/bash.nix
    ../modules/system/base.nix
    ../modules/system/networking.nix
    ../modules/system/users.nix
    ../modules/system/keyring.nix
    ../modules/system/theme.nix

    # Desktop Environment
    ../modules/desktop/hyprland.nix

    # File browser
    ../modules/apps/file-browsers/files.nix

  ];

}
