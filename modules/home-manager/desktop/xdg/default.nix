{ config
, pkgs
, ...
}: {
  xdg = {
    enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;
  };
}
