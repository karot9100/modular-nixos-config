{ config, pkgs, lib, ... }:

{

  options.mymodules.dotfiles.enable = lib.mkEnableOption "dotfiles";

  config = lib.mkIf config.mymodules.dotfiles.enable {

    system.activationScripts.dotfiles = ''
  mkdir -p /home/simon/.config

  rm -rf /home/simon/.config/waybar
  rm -rf /home/simon/.config/hypr
  rm -rf /home/simon/.config/fuzzel
  rm -rf /home/simon/.config/swayosd

  ln -sf /etc/nixos/dotfiles/waybar /home/simon/.config/waybar
  ln -sf /etc/nixos/dotfiles/hypr /home/simon/.config/hypr
  ln -sf /etc/nixos/dotfiles/fuzzel /home/simon/.config/fuzzel
  ln -sf /etc/nixos/dotfiles/swayosd /home/simon/.config/swayosd
'';

  };

}
