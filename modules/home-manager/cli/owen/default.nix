{ config
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    colorpanes
    fd
    fzf
    git
    ripgrep
    tree
    unzip
    wget
    zip
  ];

  programs.fish.enable = true;
  programs.bash.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    # enableFishIntegration = true;
    nix-direnv.enable = true;
  };
}
