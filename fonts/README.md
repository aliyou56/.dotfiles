
https://github.com/ryanoasis/nerd-fonts

```bash
# JetBrainsMono - FiraCode - Hack
uvx --from ansible-core ansible-playbook playbook.yaml -e "nerd_font_name=CascadiaCode"

# get the latest release version
curl https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq '.tag_name'
```
