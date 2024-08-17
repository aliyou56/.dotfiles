# Kitty
```bash
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
sudo update-alternatives --config x-terminal-emulator
```

# Zsh

```bash
# add this to /etc/shells
/home/aliyou/.nix-profile/bin/zsh

chsh -s $(which zsh)
```
# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -fLOs https://script.install.devinsideyou.com/zsh-z
chmod +x zsh-z && ./zsh-z
curl -fLOs https://script.install.devinsideyou.com/zsh-syntax-highlighting
chmod +x zsh-syntax-highlighting && ./zsh-syntax-highlighting
curl -fLOs https://script.install.devinsideyou.com/zsh-autosuggestions
chmod +x zsh-autosuggestions && ./zsh-autosuggestions
git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab


## Fish plugings
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher install oh-my-fish/pligun-extract
fisher install acomagu/fish-async-prompt
fisher install jhillyerd/plugin-git
