{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/aliyou";

    packages = with pkgs; [
      bat
      wezterm
      bottom
      brave
      broot
      cachix
      cargo-edit # Easy Rust dependency management
      cargo-graph # Rust dependency graphs
      cargo-watch # watch rust project and execute custom commands upon change
      clickhouse # for clickhouse-client
      coursier
      delta
      direnv
      dive
#      docker
      docker-compose
      duf
      elixir
      exa
      fd
      figlet
      fx
      fzf
      gettext
      gh
      git
      git
      git-lfs
      go
      graalvm17-ce
      graphviz
      grype
      helix
      htop
      httpie
      hyperfine
      insomnia
      ipfetch
      jq
      keychain
      kind
      kubectl
      kubernetes-helm
      lazydocker
      lazygit
      less
      luarocks
      mdcat
      minikube
      mosh
      ncdu
      neovim
      ngrok
      nix-direnv
      nodejs
      ookla-speedtest
      ripgrep
      ripgrep-all
      rustup
      scala-cli
      sd
      slack
      stow
      tldr
      tokei
      tree
      trivy
      unzip
      virt-manager
      vlc
      vscode
      wget
      wl-clipboard
      yq
      zip
      zsh
#      # consul # service discovery
#      # pre-commit
#      #kubectlx # kubectl context switching
#      #lorri # easy nix shell
#      #skaffold # local kubernetes dev tool
#      asciiquarium
#      certstrap
#      clickhouse-client
#      cmatrix
#      doppler
#      firefox
#      glow
#      gnome-browser-connector
#      kitty
#      lolcat
#      lua5
#      neofetch
#      nomad # lightwight scheduler
#      nvd
#      podman
#      pulumi
#      skim # High-powered fuzzy finder
#      sl
#      spotify-tui 
#      tealder # tldr for various shell tools
#      tig
#      tilt # Fast paced kubernetes development
#      vault # secret management
#      watchexec # Filesystem watcher/executor
#      xsv # CSV parsing utility
#      yarn # Node.js package manager
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
