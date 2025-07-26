#if status is-interactive
# Commands to run in interactive sessions can go here
#end

set -g fish_greeting
set -gx EIDITOR nvim

fish_add_path /nix/var/nix/profiles/default/bin
fish_add_path $HOME/.nix-profile/bin
fish_add_path $HOME/.local/share/coursier/bin
fish_add_path $HOME/.local/bin # set PATH so it includes user's private bin if it exists
fish_add_path $HOME/.encore/bin
# fish_add_path "$PATH:$HOME/.cargo/bin"

if test (uname) = Darwin
  fish_add_path $HOME/Library/Application Support/Coursier/bin
  eval (/opt/homebrew/bin/brew shellenv)
end

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
  set -gx JAVA_HOME (readlink $HOME/.nix-profile/bin/java | sed 's:/bin/java$::')
end

# Set up fzf key bindings
# fzf --fish | source
starship init fish | source
zoxide init fish | source
direnv hook fish | source

# to be removed
set -gx PYENV_ROOT "$HOME/.pyenv"
command -v pyenv >/dev/null || set -x PATH "$PATH:$PYENV_ROOT/bin"
pyenv init - | source
#pyenv virtualenv-init - | source

function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr --add fish-reload-config 'source ~/.config/fish/**/*.fish'
