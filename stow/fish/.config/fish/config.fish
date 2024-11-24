if status is-interactive
  # Commands to run in interactive sessions can go here
end

set -g fish_greeting
set -gx EIDITOR nvim
set -gx ATUIN_NOBIND "true"

# set -x RIPGREP_CONFIG_PATH ~/.config/ripgrep
# set -x FZF_DEFAULT_OPTS_FILE ~/.config/fzf
# set fzf_diff_highlighter delta --paging=never --width=20

fish_add_path $HOME/.nix-profile/bin
fish_add_path $HOME/.local/share/coursier/bin
fish_add_path $HOME/.local/bin

# source global settings
if test -f "$HOME/.bash_aliases"
  source "$HOME/.bash_aliases"
end

# source local settings
if test -f "$HOME/.local/.bash_aliases"
  source "$HOME/.local/.bash_aliases"
end

# setting JAVA_HOME variable
if test -e $HOME/.nix-profile/bin/java
  set -gx JAVA_HOME (readlink -e $HOME/.nix-profile/bin/java | sed 's:/bin/java$::')
end

starship init fish | source
zoxide init fish | source
direnv hook fish | source
atuin init fish | source

set -gx PYENV_ROOT "$HOME/.pyenv"
command -v pyenv >/dev/null || set -x PATH "$PATH:$PYENV_ROOT/bin"
# pyenv init - | source"
# pyenv virtualenv-init - | source"

# set -x PATH "$PATH:$HOME/.cargo/bin"

function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr --add fish-reload-config 'source ~/.config/fish/**/*.fish'

# bind to ctrl-r in normal and insert mode, add any other bindings you want here too
# bind \cr _atuin_search
# bind -M insert \cr _atuin_search
