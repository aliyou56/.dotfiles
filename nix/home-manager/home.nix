{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/aliyou";

    packages = with pkgs; [
      atuin
      bitwarden-cli
      boundary
      chezmoi
      # bruno
      clang
      zoxide           # A smarter cd command
      btop
      awscli2          # Universal Command Line Interface for Amazon Web Services
      # azure-cli        # Azure Command-Line Interface
      # google-cloud-sdk # Google Cloud Platform SDK
      # terraform
      # opentofu
      duckdb
      bat              # A cat(1) clone with wings
      bun
      bottom           # Yet another cross-platform graphical process/system monitor.
      brave
      # broot            # A new way to see and navigate directory trees
      cachix           # Command line client for Nix binary cache hosting
      # cargo-audit      # 
      cargo-edit       # Easy Rust dependency management
      # cargo-graph      # !! Rust dependency graphs
      cargo-watch      # watch rust project and execute custom commands upon change
      clickhouse       # for clickhouse-client
      coursier         # Pure Scala Artifact Fetching
      dbeaver-bin          # Free universal database tool and SQL client
      delta            # A syntax-highlighting pager for git, diff, and grep output
      direnv           # load/unload env variables. unclutter your .profile
      dive             # A tool for exploring each layer in a docker image
      # docker
      docker-compose   # Define and run multi-container applications with Docker
      duf              # Disk Usage/Free Utility - a better 'df' alternative
      elixir
      eza              # A modern replacement for ‘ls’
      fd               # A simple, fast and user-friendly alternative to 'find'
      # figlet           # creates large characters out of ordinary screen characters
      fish
      fx               # Terminal JSON viewer
      fzf              # A command-line fuzzy finder
      # gettext
      gh               # GitHub command line
      git
      git-lfs
      go
      # graalvm-ce
      jdk
      # graphviz
      helix
      htop
      httpie          # modern, user-friendly command-line HTTP client for the API era
      hyperfine       # A command-line benchmarking tool
      insomnia
      # ipfetch
      jq              # Command-line JSON processor
      keychain
      kind
      kubectl
      kubernetes-helm
      lazydocker      # The lazier way to manage everything docker
      lazygit         # simple terminal UI for git commands Topics
      less
      luarocks
      # mdcat
      minikube
      moreutils
      obsidian
      ncdu             # a disk usage analyzer with an ncurses interface
      neofetch
      # fastfetch
      neovim
      # ngrok
      nix-direnv
      nodejs
      # ookla-speedtest
      pqrs # parquet
      # protonvpn-gui
      rbenv
      ripgrep
      ripgrep-all
      rustup
      # rust-analyzer
      # sbt
      # scala-cli
      starship
      sd              # Intuitive find & replace CLI (sed alternative)
      sad             # CLI search and replace | Space Age seD
      shellcheck      # a static analysis tool for shell scripts - neovim
      sqlfluff        # A modular SQL linter and auto-formatter with support for multiple dialects and templated code.
      # slack
      stow
      tldr
      tokei
      tree
      unzip
      # virt-manager
      # vlc
      vscode
      wget
      wl-clipboard
      yarn # Node.js package manager
      yq-go
      zip
      zsh

      grype           # A vulnerability scanner for container images and filesystems
      trivy            # Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more

      # rarely used tools
      img2pdf
      # imagemagick # to be removed ??

      # wezterm
      # consul # service discovery
      # pre-commit
      # kubectlx # kubectl context switching
      # lorri # easy nix shell
      # skaffold # local kubernetes dev tool
#      asciiquarium
#      certstrap
#      cmatrix
#      doppler
#      firefox
#      glow
#      gnome-browser-connector
#      kitty
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
      # xsv # CSV parsing utility
    ];

    stateVersion = "24.05";
    username = "aliyou";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;
}
