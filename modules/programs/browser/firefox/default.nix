{ lib, pkgs, ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  home-manager.sharedModules = [
    (_: {
      programs = {
        firefox = {
          enable = true;
        };
      };
    })
  ];
}
