# modules/system/users/default.nix
# Declares mymodules.mainUser so other modules can reference the primary
# user without hardcoding a name. Actual user accounts live in ../../../users/.
{ lib, ... }:

{
  options.mymodules.mainUser = lib.mkOption {
    type        = lib.types.str;
    default     = "simon";
    description = "Primary user. Read by modules that write to $HOME.";
  };
}
