{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/aliyou";

    packages = with pkgs; [
      bat
      broot
      bottom
      delta
      direnv
      dive
      du-dust
      duf
      fd
      figlet
      fx
      fzf
      glow
      helix
      exa
      hyperfine
      jq
      ncdu
      nix-direnv
      ripgrep
      ripgrep-all
      virt-manager
      vlc
      yq
      sd
      mdcat
      tokei
    ];

    stateVersion = "22.11";
    username = "aliyou";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;
}

