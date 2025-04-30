{ config
, pkgs
, ...
}: {
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  environment.variables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    wl-clipboard
    epiphany
    nautilus
    papers
    loupe
    gnome-text-editor
    adwaita-icon-theme
  ];

  programs.dconf.enable = true;
}
