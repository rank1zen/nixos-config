{ inputs,
  config,
  pkgs,
  ...
}: {

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/desktop/niri
    ../../modules/nixos/desktop/fonts
  ];

  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlays.default
    inputs.niri-flake.overlays.niri
  ];

  home-manager =
    let
      baseConfig = user: {
        home = {
          username = user;
          homeDirectory = "/home/${user}";
          stateVersion = "24.05";
        };
        programs.home-manager.enable = true;
      };
    in
    {
      useGlobalPkgs = true;
      useUserPackages = true;

      users."gordo" = {
        imports = [
          (baseConfig "gordo")
          inputs.niri-flake.homeModules.niri

          ../../modules/home-manager/apps/foot
          ../../modules/home-manager/apps/qutebrowser

          ../../modules/home-manager/cli/neovim
          ../../modules/home-manager/cli/owen
          ../../modules/home-manager/cli/git

          ../../modules/home-manager/desktop/xdg
          ../../modules/home-manager/desktop/gtk
          ../../modules/home-manager/desktop/fuzzel
          ../../modules/home-manager/desktop/niri
        ];
      };
    };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

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

  virtualisation.docker.enable = true;
  services.dockerRegistry.enable = true;
  services.openssh.enable = true;
  services.gvfs.enable = true;

  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      git
      docker-compose
    ];
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  system.stateVersion = "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
