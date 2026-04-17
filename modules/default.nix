{ config, pkgs, lib, ... }:

{

  imports = [
    # Apps - browsers
    ./apps/browsers/chromium
    ./apps/browsers/firefox

    # Apps - cli
    ./apps/cli/yt-dlp

    # Apps - Desktop-tools
    ./apps/desktop-tools/appimage

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
    ./apps/office/thunderbird

    # Apps - services
    ./apps/services/bazarr
    ./apps/services/prowlarr
    ./apps/services/radarr
    ./apps/services/sonarr

    # Apps - terminals
    ./apps/terminals/alacritty
    ./apps/terminals/kitty

    # Desktop
    ./desktop/hyprland

    # Hardware
    ./hardware/input
    ./hardware/nvidia/nvidia-laptop
    ./hardware/power-management
    ./hardware/lenovo-legion
    ./hardware/printing
    ./hardware/sensors
    ./hardware/sound
    ./hardware/storage

    # System
    ./system/base
    ./system/bash
    ./system/dotfiles
    ./system/keyring
    ./system/networking
    ./system/theme
    ./system/users

  ];

}
