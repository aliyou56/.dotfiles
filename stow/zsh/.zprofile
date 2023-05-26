
export PATH="$PATH:/home/aliyou/.cache/scalacli/local-repo/bin/scala-cli"

# Created by `pipx` on 2022-10-07 21:35:03
export PATH="$PATH:/home/aliyou/.local/bin"

if [ -n ${XDG_SESSION_ID} ];then
    if [ -d ~/.nix-profile ];then
        for x in $(find ~/.nix-profile/share/applications/*.desktop);do
            MY_XDG_DIRS=$(dirname $(dirname $(readlink -f $x))):${MY_XDG_DIRS}
        done
        export XDG_DATA_DIRS=${MY_XDG_DIRS}:${XDG_DATA_DIRS}
    fi
fi
