# profiles/desktop.nix
# For any machine with a screen: GUI apps, audio, printing, browsers.
# Laptops import this and add power management on top.
{ ... }:

{
  imports = [ ./common.nix ];

  # Browsers
  mymodules.chromium.enable   = true;
  mymodules.firefox.enable    = true;

  # CLI tools
  mymodules.yt-dlp.enable     = true;

  # Desktop tools
  mymodules.appimage.enable   = true;

  # Dev
  mymodules.claude.enable     = true;
  mymodules.docker.enable     = false;
  mymodules.java.enable       = false;
  mymodules.virt-manager.enable = false;

  # Editors
  mymodules.gimp.enable       = false;
  mymodules.vscode.enable     = false;

  # File browsers
  mymodules.nautilus.enable   = true;
  mymodules.thunar.enable     = true;

  # Media
  mymodules.media.enable      = true;
  mymodules.music.enable      = true;
  mymodules.screenshot.enable = true;
  mymodules.video.enable      = true;

  # Office
  mymodules.libreoffice.enable = false;
  mymodules.thunderbird.enable = true;

  # Terminals
  mymodules.alacritty.enable  = true;

  # Desktop environment
  mymodules.hyprland.enable   = true;

  # Hardware common to any desktop/laptop
  mymodules.input.enable      = true;
  mymodules.printing.enable   = true;
  mymodules.sound.enable      = true;
  mymodules.storage.enable    = true;

  # System — GUI-facing
  mymodules.dotfiles.enable   = true;
  mymodules.keyring.enable    = true;
  mymodules.theme.enable      = true;
}
