{ config
, pkgs
, ...
}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "light:Adwaita,dark:Adwaita Dark";
      font-family = "JetBrains Mono:style=Medium";
      font-family-bold = "JetBrains Mono:style=Bold";
      font-family-italic = "JetBrains Mono:style=Medium";
      font-family-bold-italic = "JetBrains Mono:style=Bold";
      font-feature = "cv12,ss20";
      window-decoration = "client";
      window-theme = "system";
      window-padding-x = 20;
      window-padding-y = 10;
      window-padding-balance = true;
    };
  };
}
