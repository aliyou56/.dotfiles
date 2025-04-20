

```bash
nix build .#homeConfigurations.aliyou.activationPackage
home-manager switch --flake ~/.dotfiles/nix/home-manager#aliyou


nix fake show
nix run .#formatter.$(nix eval --impure --raw --expr 'builtins.currentSystem') flake.nix
nix run .#formatter.aarch64-darwin flake.nix
```
