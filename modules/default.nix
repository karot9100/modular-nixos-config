{ config, pkgs, lib, ... }:

{

  imports = [
    # Apps - browsers
    ./apps/browsers/chromium
    ./apps/browsers/firefox

    # Apps - cli
    ./apps/cli/yt-dlp

    # Apps - dev
    ./apps/dev/docker
    ./apps/dev/java
    ./apps/dev/virt-manager
    ./apps/dev/claude

    # Apps - editors
    ./apps/editors/gimp
    ./apps/editors/vim
    ./apps/editors/vscode

    # Apps - file-browsers
    ./apps/file-browsers/nautilus
    ./apps/file-browsers/thunar

    # Apps - gaming
    ./apps/gaming/gamemode
    ./apps/gaming/permittedpackages
    ./apps/gaming/steam
    ./apps/gaming/wine

    # Apps - media
    ./apps/media/media
    ./apps/media/music
    ./apps/media/screenshot
    ./apps/media/video

    # Apps - office
    ./apps/office/libreoffice

    # Apps - services
    ./apps/services/bazarr.nix
    ./apps/services/prowlarr.nix
    ./apps/services/radarr.nix
    ./apps/services/sonarr.nix

    # Apps - terminals
    ./apps/terminals/alacritty
    ./apps/terminals/kitty

    # Desktop
    ./desktop/hyprland

    # Hardware
    ./hardware/input.nix
    ./hardware/nvidia/nvidia-laptop.nix
    ./hardware/power-management.nix
    ./hardware/lenovo-legion.nix
    ./hardware/printing.nix
    ./hardware/sensors.nix
    ./hardware/sound.nix
    ./hardware/storage.nix

    # System
    ./system/base.nix
    ./system/bash.nix
    ./system/dotfiles.nix
    ./system/keyring.nix
    ./system/networking.nix
    ./system/theme.nix
    ./system/users.nix

  ];

}
