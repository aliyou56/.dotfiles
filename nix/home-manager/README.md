

```bash
nix build .#homeConfigurations.aliyou.activationPackage
home-manager switch --flake ~/.dotfiles/nix/home-manager#aliyou


nix fake show
nix run .#formatter.$(nix eval --impure --raw --expr 'builtins.currentSystem') flake.nix
nix run .#formatter.aarch64-darwin flake.nix


## clean
sqlite3 /nix/var/nix/db/db.sqlite "SELECT path FROM ValidPaths WHERE NOT EXISTS (SELECT 1 FROM Refs WHERE reference = ValidPaths.id);"
sqlite3 /nix/var/nix/db/db.sqlite "DELETE FROM Refs WHERE NOT EXISTS (SELECT 1 FROM ValidPaths WHERE id = referrer);"

```
