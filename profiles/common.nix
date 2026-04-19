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
