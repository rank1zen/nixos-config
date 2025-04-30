{ config
, pkgs
, ...
}: {
  home = {
    sessionVariables = {
      VISUAL = "nvim";
    };
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      python
      go
      cpp
      html
      make
      nix
      sql
    ];
    extraPackages = with pkgs; [
      # TODO: remove these and add them as flake envs
      lua-language-server
      stylua
    ];
  };
}
