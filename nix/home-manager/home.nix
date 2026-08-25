{ config, pkgs, ...  }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.packages = with pkgs; [
    # herdr
    opencode
    claude-code
    mermaid-cli
    # tree-sitter ## mise
    # d2          ## mise
    # flyway      ## mise
    # pnpm        ## mise
    # rtk         ## mise
    neovide

    # language servers
    gopls
    bash-language-server
    dockerfile-language-server
    elixir-ls
    vscode-langservers-extracted
    lemminx
    lua-language-server
    marksman
    ruby-lsp
    sqls
    typescript-language-server
    yaml-language-server

    # shellcheck    ## mise  # a static analysis tool for shell scripts - neovim
    stylua
    prettier
    eslint_d
    sqlfluff        # A modular SQL linter and auto-formatter with support for multiple dialects and templated code.

    uv
    # coreutils
    # boundary
    # chezmoi
    # duckdb      ## mise
    brave
    cachix           # Command line client for Nix binary cache hosting
    # clickhouse       # for clickhouse-client
    # postgresql
    pgcli
    # cockroach
    gh               # GitHub command line
    git
    git-lfs
    gnupg
    # helix ## mise
    htop
    # insomnia # issue on macos
    keychain
    less
    moreutils
    obsidian
    ncdu             # a disk usage analyzer with an ncurses interface
    # neofetch
    neovim
    # ngrok
    # protonvpn-gui
    # slack
    stow
    tldr
    tree
    unzip
    vscode
    wget
    # wl-clipboard  # issue on macos 02/08/25
    yq-go
    zip

    # bun      ## mise
    # clang # !! mix with rust tools
    coursier         # Pure Scala Artifact Fetching
    # elmPackages.elm
    beamPackages.elixir
    # go       ## mise
    # graalvm-ce
    # jdk17    ## mise
    # lua      ## mise
    luarocks
    # nodejs   ## mise
    rbenv
    rustup
    # cargo-audit      #
    cargo-edit       # Easy Rust dependency management
    # cargo-graph      # !! Rust dependency graphs
    # cargo-watch      # watch rust project and execute custom commands upon change
    # yarn            ## mise # Node.js package manager

    bat              # A cat(1) clone with wings
    bottom           # Yet another cross-platform graphical process/system monitor.
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
    xh
    tokei
    tuicr

    fish
    zsh
    starship
    zoxide           # A smarter cd command
    # wezterm
    # kitty
    # ghostty

    dive             # A tool for exploring each layer in a docker image
    docker-compose   # Define and run multi-container applications with Docker
    kubectl
    # minikube     ## mise
    # kubernetes-helm
    # awscli2           # Universal Command Line Interface for Amazon Web Services
    # azure-cli        # Azure Command-Line Interface
    # google-cloud-sdk # Google Cloud Platform SDK
    # terraform
    # opentofu
    # podman
    # kubectx         # kubectl context switching
    # skaffold         # local kubernetes dev tool
    # tilt             # Fast paced kubernetes development
    # vault            # secret management

    # tectonic
    # typst
    # tinymist           # typst lsp

    # grype              # A vulnerability scanner for container images and filesystems
    # trivy              # Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more

    # gettext
    # graphviz
    # vlc
    # tor-browser # issue on mac 2/09/2025

    # nerd-fonts.jetbrains-mono
    # nerd-fonts.hack
  ];

  # fonts.fontconfig.enable = true;
  home.sessionVariables.EDITOR = "nvim";

  home.file.".bash_aliases".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.bash_aliases";
  home.file.".wezterm.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.wezterm.lua";
  home.file.".gitconfig".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.gitconfig";
  home.file.".profile".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.profile";
  home.file.".psqlrc".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.psqlrc";
  home.file.".fdignore".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.fdignore";
  home.file."AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".claude/CLAUDE.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";

  home.file.".zshrc".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.zshrc";
  home.file.".zprofile".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.zprofile";
  home.file.".oh-my-zsh/custom/themes/intheloop.zsh-theme".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.oh-my-zsh/custom/themes/intheloop.zsh-theme";

  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
  home.file.".config/fish/config.fish".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/fish/config.fish";
  home.file.".config/fish/fish_plugins".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/fish/fish_plugins";
  home.file.".config/starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/starship.toml";
  home.file.".config/ghostty/config".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/ghostty/config";
  home.file.".config/git/ignore".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/git/ignore";
  home.file.".config/nix/nix.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nix/nix.conf";
  home.file.".config/mise/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/mise/config.toml";
  home.file.".config/uv/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/uv/config.toml";
  home.file.".config/herdr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr/config.toml";
  home.file.".config/pip/pip.conf".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/pip/pip.conf";
  home.file.".config/opencode/opencode.jsonc".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/opencode/opencode.jsonc";
  home.file.".config/zed/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/zed/settings.json";

  home.file.".config/gh/config.yml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/gh/config.yml";
  home.file.".config/gh/hosts.yml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/gh/hosts.yml";
  home.file.".config/helix/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/helix/config.toml";
  home.file.".config/helix/languages.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/helix/languages.toml";
  home.file.".config/bottom/bottom.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/bottom/bottom.toml";
}
