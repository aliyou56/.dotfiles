{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/aliyou";

    packages = with pkgs; [
#      asciiquarium
      git
      broot
      trivy
      grype
      firefox
      bat
      bottom
      cachix
#      certstrap
#      cmatrix
#      coursier
#      cowsay
      exa
      sd
      tokei
      delta
      direnv
      dive
#      docker
#      docker-compose
#      doppler
      duf
      fd
      figlet
      fx
      fzf
      go
      elixir
      rustup
      httpie
      helix
      hyperfine
      jq
      kind
      kubectl
      lazydocker
      lazygit
      luarocks
      minikube
      tldr
      yq
      kubernetes-helm
#      firefox
      gettext
      gh
      git
#      glow
      mdcat
#      graalvm17-ce
#      graphviz
#      gum
      htop
      ipfetch
      keychain
      less
#      lolcat
      mosh
      ncdu
#      neofetch
#      neovim
      ngrok
      nix-direnv
#      nvd
      ookla-speedtest
#      pulumi
      ripgrep
      ripgrep-all
#      scala-cli
#      sl
      stow
      tig
      tree
      unzip
#      wl-clipboard
      zip
#      zsh
      vlc
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
