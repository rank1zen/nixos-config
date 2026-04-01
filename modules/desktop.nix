{ pkgs, ... }:
{
  environment = {
    systemPackages = [
      pkgs.vim
      pkgs.wget
      pkgs.git
      pkgs.wl-clipboard
      pkgs.epiphany
      pkgs.nautilus
      pkgs.gnome-text-editor
      pkgs.gnome-disk-utility
    ];
  };

  programs.niri.enable = true;

  services.displayManager.ly.enable = true;
}
