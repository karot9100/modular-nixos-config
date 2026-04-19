# profiles/common.nix
# Baseline applied to every host. Pulled in via server/desktop/laptop profiles.
# Don't import this directly in a host — use one of the role profiles.
{ ... }:

{
  imports = [ ../modules ];

  mymodules.mainUser = "simon";

  # System baseline every machine should have.
  mymodules.base.enable       = true;
  mymodules.bash.enable       = true;
  mymodules.vim.enable        = true;
  mymodules.networking.enable = true;
}
