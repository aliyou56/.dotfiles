# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$PATH:$HOME/.local/share/coursier/bin"
export PATH="$PATH:$HOME/.cache/scalacli/local-repo/bin/scala-cli"

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# fix app icons (installed by nix)
if [ -n "${XDG_SESSION_ID}" ];then
    if [ -d ~/.nix-profile ];then
        for x in $(find ~/.nix-profile/share/applications/*.desktop); do
            MY_XDG_DIRS=$(dirname $(dirname $(readlink -f $x))):${MY_XDG_DIRS}
        done
        export XDG_DATA_DIRS=${MY_XDG_DIRS}:${XDG_DATA_DIRS}
    fi
fi
