{ config, pkgs, lib, ... }:

{

  imports = [
    ../modules
  ];

  # Dev
  mymodules.docker.enable           = true;

  # Editors
  mymodules.vim.enable              = true;

  # System
  mymodules.base.enable             = true;
  mymodules.bash.enable             = true;
  mymodules.networking.enable       = true;
  mymodules.users.enable            = true;





}
