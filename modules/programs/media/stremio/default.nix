{pkgs, ...}: {
  home-manager.sharedModules = [
    (_: {
      programs.stremio = {
        enable = true;
      };
    })
  ];
}
