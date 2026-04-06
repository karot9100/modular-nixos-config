{ config, pkgs, lib, ... }:

{

  nixpkgs.config.permittedInsecurePackages = [
    
    # Lutris
    "mbedtls-2.28.10"
    
    # Needed for RS3 in Bolt launcher
    "openssl-1.1.1w"
  ];

}

