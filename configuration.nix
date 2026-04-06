{ config, pkgs, ... }:

{
  imports = [ 

      ./hardware-configuration.nix
      ./hosts/vm.nix

    ];

}
