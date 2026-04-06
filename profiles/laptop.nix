{ config, pkgs, lib, ... }:

{

  imports = [

    # Apps - browsers
    ../modules/apps/browsers/chromium.nix
    ../modules/apps/browsers/firefox.nix

    # Apps - cli
    ../modules/apps/cli/yt-dlp.nix

    # Apps - dev
    #../modules/apps/dev/docker.nix
    #../modules/apps/dev/java.nix
    ../modules/apps/dev/virt-manager.nix

    # Apps - editors
    #../modules/apps/editors/gimp.nix
    ../modules/apps/editors/vim.nix
    #../modules/apps/editors/vscode.nix

    # Apps - file-browsers
    ../modules/apps/file-browsers/files.nix

    # Apps - gaming
    ../modules/apps/gaming/gamemode.nix
    ../modules/apps/gaming/permittedpackages.nix
    ../modules/apps/gaming/steam.nix
    ../modules/apps/gaming/wine.nix

    # Apps - media
    ../modules/apps/media/media.nix
    ../modules/apps/media/music.nix
    ../modules/apps/media/screenshot.nix
    ../modules/apps/media/video.nix

    # Apps - office
    #../modules/apps/office/libreoffice.nix

    # Apps - terminals
    ../modules/apps/terminals/alacritty.nix
    ../modules/apps/terminals/kitty.nix

    # Desktop
    ../modules/desktop/hyprland.nix

    # Hardware
    ../modules/hardware/input.nix
    ../modules/hardware/nvidia-laptop.nix
    ../modules/hardware/power-management.nix
    ../modules/hardware/printing.nix
    ../modules/hardware/sensors.nix
    ../modules/hardware/sound.nix
    ../modules/hardware/storage.nix

    # Services

    # System
    ../modules/system/base.nix
    ../modules/system/bash.nix
    ../modules/system/dotfiles.nix
    ../modules/system/keyring.nix
    ../modules/system/networking.nix
    ../modules/system/theme.nix
    ../modules/system/users.nix



  ];

}
