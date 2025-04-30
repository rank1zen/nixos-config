{ config
, pkgs
, ...
}: {
  programs.zathura = {
    enable = true;
    options = {
      default-bg = "rgba(255,255,255,0.9)";
      guioptions = "";
      page-padding = 10;
      window-title-home-tilde = "true";
      window-title-page = "true";
    };
  };
}
