{ config
, pkgs
, ...
}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      inter
      jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif"
        ];
        sansSerif = [
          "Inter"
          "DejaVu Sans"
        ];
        monospace = [
          "JetBrains Mono"
          "DejaVu Sans Mono"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
