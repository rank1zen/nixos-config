{ inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.overlays = [
    inputs.niri-flake.overlays.niri
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  time.hardwareClockInLocalTime = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager.ly.enable = true;

  users.users = {
    gordo = {
      isNormalUser = true;
      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
      ];
    };
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.flatpak.enable = true;

  virtualisation.docker.enable = true;
  services.dockerRegistry.enable = true;
  services.openssh.enable = true;
  services.gvfs.enable = true;

  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      git
      wl-clipboard
      epiphany
      nautilus
      gnome-text-editor
      gnome-disk-utility
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      roboto
      adwaita-fonts
      cherry
    ];
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  environment.variables.NIXOS_OZONE_WL = "1";

  programs.dconf.enable = true;

  system.stateVersion = "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
