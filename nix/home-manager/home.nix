{ config, pkgs, ...  }: 

{
  home.packages = with pkgs; [

  # claude-code
  code-cursor
  tree-sitter
  flix
  mermaid-cli
  d2
  typst
  tinymist
  flyway

  uv
  pyenv # to be removed
  # coreutils
  # atuin
  # bitwarden-cli # issue macos
  # boundary
  chezmoi
  # bruno
  duckdb
  brave
  cachix           # Command line client for Nix binary cache hosting
  clickhouse       # for clickhouse-client
  postgresql
  pgcli
  # cockroach
  dbeaver-bin      # Free universal database tool and SQL client
  gh               # GitHub command line
  git
  git-lfs
  gnupg
  helix
  htop
  # insomnia # issue macos
  keychain
  less
  # mdcat
  moreutils
  obsidian
  ncdu             # a disk usage analyzer with an ncurses interface
  neofetch
  neovim
  # ngrok
  # protonvpn-gui
  shellcheck      # a static analysis tool for shell scripts - neovim
  sqlfluff        # A modular SQL linter and auto-formatter with support for multiple dialects and templated code.
  # slack
  stow
  tldr
  tree
  unzip
  vscode
  wget
  wl-clipboard
  yq-go
  zip

  bun
  clang
  coursier         # Pure Scala Artifact Fetching
  elmPackages.elm
  elixir
  go
  # graalvm-ce
  jdk
  lua
  luarocks
  nodejs
  # sbt
  # scala-cli
  rbenv
  rustup
  # rust-analyzer
  # cargo-audit      #
  cargo-edit       # Easy Rust dependency management
  # cargo-graph      # !! Rust dependency graphs
  cargo-watch      # watch rust project and execute custom commands upon change
  yarn             # Node.js package manager

  bat              # A cat(1) clone with wings
  bottom           # Yet another cross-platform graphical process/system monitor.
  # broot            # A new way to see and navigate directory trees
  btop             #
  delta            # A syntax-highlighting pager for git, diff, and grep output
  direnv           # load/unload env variables. unclutter your .profile
  nix-direnv       #
  httpie           # modern, user-friendly command-line HTTP client for the API era
  hyperfine        # A command-line benchmarking tool
  jq               # Command-line JSON processor
  lazydocker       # The lazier way to manage everything docker
  lazygit          # simple terminal UI for git commands Topics
  duf              # Disk Usage/Free Utility - a better 'df' alternative
  eza              # A modern replacement for ‘ls’
  fd               # A simple, fast and user-friendly alternative to 'find'
  fx               # Terminal JSON viewer
  fzf              # A command-line fuzzy finder
  pqrs             # parquet
  ripgrep
  ripgrep-all
  sad              # CLI search and replace | Space Age seD
  sd               # Intuitive find & replace CLI (sed alternative)
  tokei

  fish
  zsh
  starship
  zoxide           # A smarter cd command
  # wezterm
  # kitty

  dive             # A tool for exploring each layer in a docker image
  # docker
  docker-compose   # Define and run multi-container applications with Docker
  kind
  kubectl
  minikube
  kubernetes-helm
  awscli2           # Universal Command Line Interface for Amazon Web Services
  # azure-cli        # Azure Command-Line Interface
  # google-cloud-sdk # Google Cloud Platform SDK
  # terraform
  # opentofu
  # podman
  # kubectlx         # kubectl context switching
  # skaffold         # local kubernetes dev tool
  # tilt             # Fast paced kubernetes development
  # vault            # secret management

  grype              # A vulnerability scanner for container images and filesystems
  trivy              # Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more


  # consul # service discovery
  # pre-commit
  # lorri # easy nix shell
  # asciiquarium
  # certstrap
  # cmatrix
  # doppler
  # firefox
  # glow
  # gnome-browser-connector
  # nomad # lightwight scheduler
  # nvd
  # pulumi
  # sl
  # tealder # tldr for various shell tools
  # tig
  # watchexec # Filesystem watcher/executor
  # xsv # CSV parsing utility

  # gettext
  # graphviz
  # ipfetch
  # ookla-speedtest
  # virt-manager
  # vlc
 ];
}
