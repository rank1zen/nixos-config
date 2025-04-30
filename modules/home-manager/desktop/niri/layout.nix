{ config
, pkgs
, ...
}: {
  programs.niri.settings.layout = {
    gaps = 20;
    always-center-single-column = true;
    default-column-display = "tabbed";

    border.enable = false;
    focus-ring.enable = false;

    shadow = {
      enable = true;
      offset.x = 0;
      offset.y = 4;
      softness = 20;
      spread = 0;
      color = "#00000040";
      inactive-color = "#00000020";
    };

    tab-indicator = {
      enable = true;
      hide-when-single-tab = true;
      place-within-column = true;

      gap = 6;
      width = 6;
      length.total-proportion = 0.5;
      gaps-between-tabs = 6;

      position = "left";
      active = { color = "#888888"; };
      inactive = { color = "#bbbbbb"; };
      corner-radius = 2;
    };
  };
}
