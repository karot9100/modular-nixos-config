{ config, pkgs, lib, ... }:

{

  imports = [
    # Apps - browsers
    ./apps/browsers/chromium.nix
    ./apps/browsers/firefox.nix

    # Apps - cli
    ./apps/cli/yt-dlp.nix

    # Apps - dev
    ./apps/dev/docker.nix
    ./apps/dev/java.nix
    ./apps/dev/virt-manager.nix

    # Apps - editors
    ./apps/editors/gimp.nix
    ./apps/editors/vim.nix
    ./apps/editors/vscode.nix

    # Apps - file-browsers
    ./apps/file-browsers/files.nix

    # Apps - gaming
    ./apps/gaming/gamemode.nix
    ./apps/gaming/permittedpackages.nix
    ./apps/gaming/steam.nix
    ./apps/gaming/wine.nix

    # Apps - media
    ./apps/media/media.nix
    ./apps/media/music.nix
    ./apps/media/screenshot.nix
    ./apps/media/video.nix

    # Apps - office
    ./apps/office/libreoffice.nix

    # Apps - terminals
    ./apps/terminals/alacritty.nix
    ./apps/terminals/kitty.nix

    # Desktop
    ./desktop/hyprland.nix

    # Hardware
    ./hardware/input.nix
    ./hardware/nvidia-laptop.nix
    ./hardware/power-management.nix
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
