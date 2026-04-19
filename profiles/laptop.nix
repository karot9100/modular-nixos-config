# profiles/laptop.nix
# Desktop + laptop hardware extras (power, sensors).
# Machine-specific hardware (NVIDIA, Lenovo Legion) belongs in the host file.
{ ... }:

{
  imports = [ ./desktop.nix ];

  # Laptop-class hardware
  mymodules.power-management.enable = true;
  mymodules.sensors.enable          = true;

  # Gaming (move to host if only some laptops should have it)
  mymodules.gamemode.enable         = true;
  mymodules.perm-pkgs.enable        = true;
  mymodules.steam.enable            = true;
  mymodules.wine.enable             = true;
}
