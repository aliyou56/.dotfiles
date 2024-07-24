
export PATH="$PATH:$HOME/.cache/scalacli/local-repo/bin/scala-cli"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$PATH:$HOME/.local/bin"
end

# fix app icons (installed by nix)
if [ -n ${XDG_SESSION_ID} ];then
    if [ -d ~/.nix-profile ];then
        for x in $(find ~/.nix-profile/share/applications/*.desktop);do
            MY_XDG_DIRS=$(dirname $(dirname $(readlink -f $x))):${MY_XDG_DIRS}
        done
        export XDG_DATA_DIRS=${MY_XDG_DIRS}:${XDG_DATA_DIRS}
    fi
fi
