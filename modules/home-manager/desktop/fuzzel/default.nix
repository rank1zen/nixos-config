{ config
, pkgs
, ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        # icons-enabled = false;
        # placeholder = "run application";
        # prompt = "";
        font = "Inter:size=13";
        use-bold = true;
        horizontal-pad = 20;
        vertical-pad = 20;
        anchor = "top";
      };
      colors = {
        background = "161616ff";
        text = "ffffffff";
        # prompt = "000000ff";
        # placeholder = "000000ff";
        match = "ee5396ff";
        selection = "262626ff";
        selection-text = "33b1ffff";
        selection-match = "ee5396ff";
      };
      border = {
        width = 0;
        radius = 8;
      };
    };
  };
}
