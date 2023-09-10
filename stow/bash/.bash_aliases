alias aliases='bat ~/.bash_aliases --pager never && bat ~/.local/.bash_aliases --pager never 2>/dev/null'

alias b='bloop'
alias br='bloop exit && bloop about'
alias ssh='kitty +kitten ssh'
alias c='code .'
alias sc='scala-cli'
alias ce='code . && exit'
# alias dg-with-tests='bloop projects --dot-graph | dot -Tsvg -o dependency-graph.svg'
# alias dg='bloop projects --dot-graph | sed "/-test/d" | dot -Tsvg -o dependency-graph.svg'
alias di='echo dotenv >> .envrc && touch .env && direnv allow'
# alias din='echo "use nix" > .envrc && echo "watch_file nix/*" >> .envrc && di'
# alias dots='cd ~/.dotfiles'
alias dr='direnv reload'
alias ipp='curl ifconfig.me && echo'
# alias ipl="hostname -I | awk '{print $1}'"
# alias ipl="ip -f inet addr show wlp3s0 | awk '/inet / {print $2}' | cut -d/ -f1"
alias java-switch='cs java --jvm $(cs java --available | fzf) --env 2>/dev/null > .envrc && di'
alias jps='jps -lm'
alias jpsk9='jps | fzf --reverse -m -e -i | cut -d " " -f1 | xargs kill -9 2>/dev/null'
# alias jpsk='jps | fzf --reverse -m -e -i | cut -d " " -f1 | xargs kill 2>/dev/null'
alias k='kubectl'
# alias list-colors='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\''\n'\''}; done'
alias sbtd='sbt -jvm-debug 5005'
alias sbtnoss='sbt -Dsbt.supershell=false'
alias scalac-phases='scalac -Xshow-phases'
alias scalalines='find . -path "*/src*" -name "*.scala" | xargs wc -l | sort -n'
alias ld='lazydocker'
alias dc='docker-compose'

alias update='\
  sudo apt update && \
  sudo apt -y full-upgrade && \
  sudo apt -y autoremove && \
  cs update && \
  hmu && \
  nvim --headless +PackerSync +qall'

alias v='nvim'
alias gt='git ls-tree -r --name-only HEAD | tree --fromfile'

# Git and GitHub
alias fgco='gco $(gb | fzf)'
alias fgcor='gco --track $(gbr | fzf)'
alias fgcot='gco $(g tag | fzf)'
alias gapaa='gaa -N && gapa .'
alias gca!='gaa && g commit --amend'
alias gcaf='gaa && g commit --fixup'
alias gcam='gaa && gcmsg'
alias gcamr='gcam "chore: refactoring"'
alias gcan!='gaa && g commit --amend --no-edit --no-verify'
alias gcangpf!='gcan! && gpf!'
alias gcas='gaa && g commit --squash'
alias ghdi='gi && gh rcd && gpsup && gh rvw'
alias ghdim='gim && gh rcd && gpsup && gh rvw'
alias ghdip='gi && gh rcdp && gpsup && gh rvw'
alias ghi='gi && gh rc && gpsup && gh rvw'
alias ghim='gim && gh rc && gpsup && gh rvw'
alias ghip='gi && gh rcp && gpsup && gh rvw'
alias gi='g init && gcam "Initial commit"'
alias gim='g init -b master && gcam "Initial commit"'
alias gitalias='alias | grep git | fzf'
alias glol='g log --graph --pretty='\''%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen%cr %C(bold blue)%an%Creset'\'''
alias glola='glol --all'
alias gpe='gp && exit'
alias grbio='grbi @{u}'
alias grbiom='grbi origin/$(git_main_branch)'
alias grbom='grb origin/$(git_main_branch)'
alias grhom='grh origin/$(git_main_branch)'
alias groh='grh @{u}'
alias grohh='grhh @{u}'
alias gs='git -c delta.side-by-side=true'
alias gsd='gs diff'
alias gsds='gs diff --staged'
alias gstfu='g commit --amend && grbc'
alias gwipe='gwip && exit'
alias gwipgp='gwip && gp'
alias gwipgpe='gwip && gpe'
alias gwipp='gcmsg "--wip-- [skip ci]" --no-verify --no-gpg-sign'
# alias hk='gcam housekeeping && gpe'
alias lg='lazygit'

DOTFILES="$HOME/work/github/.dotfiles"
# Nix Home Manager
alias hm='home-manager'
alias hmd='cd ${DOTFILES}/nix/home-manager'
alias hmgd='hm generations | head -n 2 | tac | cut -d " " -f 7 | xargs nix store diff-closures'
alias hmp='hm packages'
alias hms='hm switch --flake ${DOTFILES}/nix/home-manager#aliyou && hmgd'
alias hmu='nix flake update ${DOTFILES}/nix/home-manager && hms'
alias hmhe='nvim ${DOTFILES}/nix/home-manager/home.nix'
alias reload='hms && source ~/.zshrc'
alias garbage='nix-collect-garbage -d' # && docker image prune --force

# Changing "ls" to "exa"
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.='eza -a | egrep "^\."'

alias http='noglob http'

#alias say='espeak'
alias cp='cp -iv'
alias mv='mv -iv'
alias h='history'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias nowtime='now'
alias path='echo -e ${PATH//:/\\n}'
alias poweroff='sudo shutdown -h now'
alias restart='sudo shutdown -r now'
alias grep='grep --colour=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Apply changes to aliases
alias sa='source ~/.bash_aliases;source ~/.zshrc;echo "Bash aliases sourced."'
#alias sa='source ~/.bash_aliases;source ~/.bashrc;source ~/.zshrc;echo "Bash aliases sourced."'

# Edit Aliases
alias via='nvim ~/.bash_aliases'
alias viz='nvim ~/.zshrc'
alias vin='cd ~/.config/nvim && nvim'
