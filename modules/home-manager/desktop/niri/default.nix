{ config
, pkgs
, ...
}: {
  imports = [
    ./binds.nix
    ./layout.nix
    ./window-rules.nix
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot %Y-%m-%d %H:%M:%S.png";

      cursor = {
        theme = "Vanilla-DMZ";
        size = 24;
      };

      hotkey-overlay.skip-at-startup = true;

      spawn-at-startup = [
        { command = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]; }
      ];
      input = {
        mouse.accel-profile = "flat";
        mouse.accel-speed = 1.0;
      };
      outputs = {
        "HDMI-A-1".background-color = "#ffffff";
      };
    };
  };
}
