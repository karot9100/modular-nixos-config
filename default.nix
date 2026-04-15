{ config, pkgs, lib, ... }:

{

  options.mymodules..enable = lib.mkEnableOption "";

  config = lib.mkIf config.mymodules..enable {



  };

}
