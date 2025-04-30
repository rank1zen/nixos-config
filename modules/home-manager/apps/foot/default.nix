{ config
, pkgs
, ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "${pkgs.fish}/bin/fish";
        font = "JetBrains Mono:size=11:style=Medium";
        # font-bold        = "JetBrains Mono:style=Bold";
        # font-italic      = "JetBrains Mono:style=Medium";
        # font-bold-italic = "JetBrains Mono:style=Bold";
        font-size-adjustment = "1";
        pad = "20x10";
      };
      scrollback = {
        indicator-position = "none";
      };
      # cursor = {
      #   style = "underline";
      # };
      colors = {
        foreground = "202122";
        background = "ffffff";

        regular0 = "202122";
        regular1 = "ea4335";
        regular2 = "34a853";
        regular3 = "fbbc04";
        regular4 = "4285f4";
        regular5 = "a142f4";
        regular6 = "24c1e0";
        regular7 = "f8f2e5";

        bright0 = "202122";
        bright1 = "ea4335";
        bright2 = "34a853";
        bright3 = "fbbc04";
        bright4 = "4285f4";
        bright5 = "a142f4";
        bright6 = "24c1e0";
        bright7 = "f8f2e5";
      };
    };
  };
}
