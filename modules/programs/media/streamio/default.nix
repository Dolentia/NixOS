{pkgs, ...}: {
  home-manager.sharedModules = [
    (_: {
      programs.streamio = {
        enable = true;
      };
    })
  ];
}
