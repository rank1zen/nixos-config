{ inputs
, pkgs
, ...
}: {
  programs.git = {
    enable = true;
    userName = "gordon";
    userEmail = "gordonchen2014@gmail.com";
  };
}
