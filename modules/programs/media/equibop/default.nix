{ pkgs, ... }: {
  home-manager.sharedModules = [
    (_: {
      programs.equibop.enable = true;
    })
  ];
}