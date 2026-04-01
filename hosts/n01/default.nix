{ ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common.nix
    ../../modules/desktop.nix
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
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  nix.settings.trusted-users = [
    "root"
    "gordo"
  ];

  environment.variables.NIXOS_OZONE_WL = "1";

  programs.dconf.enable = true;
}
