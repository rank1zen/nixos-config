{ config
, pkgs
, ...
}: {
  programs.niri.settings.window-rules = [
    {
      matches = [
        { app-id = "^foot$"; }
        { app-id = "^org\.gnome"; }
      ];
      geometry-corner-radius =
        let
          radius = 12.0;
        in
        {
          bottom-left = radius;
          bottom-right = radius;
          top-left = radius;
          top-right = radius;
        };
      clip-to-geometry = true;
    }
    {
      matches = [
        { app-id = "^foot$"; }
      ];
      min-width = 500;
    }
    {
      matches = [
        { app-id = "^org\.gnome\.Loupe$"; }
      ];
      open-floating = true;
    }
  ];
}
