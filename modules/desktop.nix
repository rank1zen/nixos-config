{ pkgs, ... }:
{
  environment = {
    systemPackages = [
      pkgs.vim
      pkgs.git
      pkgs.xwayland-satellite
    ];
  };

  programs.niri.enable = true;

  services.displayManager.ly.enable = true;
}
